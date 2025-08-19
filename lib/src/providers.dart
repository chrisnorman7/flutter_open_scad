import 'dart:convert';
import 'dart:io';

import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_open_scad/src/json/project_module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

/// The preferences key where the preferences are stored.
const openFilesKey = 'flutter_open_scad_open_files';

/// Provide the list of all open files.
@riverpod
Future<OpenFiles> openFiles(final Ref ref) async {
  final preferences = SharedPreferencesAsync();
  final filenames = (await preferences.getStringList(openFilesKey)) ?? [];
  return OpenFiles(
    filenames.where((final filename) => File(filename).existsSync()).toList(),
  );
}

/// Provide a single project.
@riverpod
ProjectContext project(final Ref ref, final String filename) {
  final file = File(filename);
  final source = file.readAsStringSync();
  final json = jsonDecode(source);
  return ProjectContext(
    file: file,
    project: Project.fromJson(json as Map<String, dynamic>),
  );
}

/// Provide a single module.
@riverpod
ProjectModule projectModule(
  final Ref ref,
  final String projectFilename,
  final String moduleId,
) {
  final projectContext = ref.watch(projectProvider(projectFilename));
  return projectContext.project.modules.firstWhere(
    (final module) => module.id == moduleId,
  );
}

/// Provide all shapes in a given module.
@riverpod
List<Shape> moduleShapes(
  final Ref ref,
  final String projectFilename,
  final String moduleId,
) {
  final module = ref.watch(projectModuleProvider(projectFilename, moduleId));
  return module.shapes;
}

/// Provide a single shape.
@riverpod
Shape moduleShape(
  final Ref ref,
  final String projectFilename,
  final String moduleId,
  final String shapeId,
) {
  final shapes = ref.watch(moduleShapesProvider(projectFilename, moduleId));
  return shapes.firstWhere((final shape) => shape.id == shapeId);
}

/// Provide all variables for a given module.
@riverpod
List<ModuleVariable> moduleVariables(
  final Ref ref,
  final String projectFilename,
  final String moduleId,
) {
  final module = ref.watch(projectModuleProvider(projectFilename, moduleId));
  return module.variables;
}

/// Provide a single variable.
@riverpod
ModuleVariable moduleVariable(
  final Ref ref,
  final String projectFilename,
  final String moduleId,
  final String variableId,
) {
  final variables = ref.watch(
    moduleVariablesProvider(projectFilename, moduleId),
  );
  return variables.requireVariable(variableId);
}
