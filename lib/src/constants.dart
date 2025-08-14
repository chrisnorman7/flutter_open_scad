import 'dart:convert';
import 'dart:io';

import 'package:backstreets_widgets/extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_open_scad/src/json/project.dart';
import 'package:flutter_open_scad/src/project_context.dart';
import 'package:flutter_open_scad/src/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// The UUID generator to use.
const _uuid = Uuid();

/// Generate a new id.
String newId() => _uuid.v7();

/// Create a new project.
Future<void> createProject(final WidgetRef ref) async {
  final filename = await FilePicker.platform.saveFile(
    allowedExtensions: ['.json'],
    dialogTitle: 'Create Project',
    initialDirectory: (await getApplicationDocumentsDirectory()).path,
  );
  if (filename == null) {
    return;
  }
  final project = Project();
  final String filePath;
  if (path.extension(filename) != '.json') {
    filePath = '$filename.json';
  } else {
    filePath = filename;
  }
  final file = File(filePath);
  ProjectContext(file: file, project: project).save(ref);
  final preferences = await ref.read(appPreferencesProvider.future);
  preferences.openFiles.add(filePath);
  await preferences.save();
  ref.invalidate(openFilesProvider);
}

/// Open an existing project.
Future<void> openProject(final WidgetRef ref) async {
  final results = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    allowedExtensions: ['.json'],
    dialogTitle: 'Open Project File(s)',
    initialDirectory: (await getApplicationDocumentsDirectory()).path,
  );
  final filenames = <String>[];
  for (final result in results?.files ?? <PlatformFile>[]) {
    final filename = result.path;
    if (filename == null) {
      continue;
    }
    try {
      final file = File(filename);
      final source = file.readAsStringSync();
      final json = jsonDecode(source);
      Project.fromJson(json as Map<String, dynamic>);
      filenames.add(file.path);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      final context = ref.context;
      if (context.mounted) {
        await context.showMessage(
          message: 'There was an error loading $filename: $e',
        );
      }
    }
  }
  final preferences = await ref.read(appPreferencesProvider.future);
  preferences.openFiles.addAll(filenames);
  await preferences.save();
  ref.invalidate(appPreferencesProvider);
}
