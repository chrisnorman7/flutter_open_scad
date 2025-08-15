import 'dart:convert';
import 'dart:io';

import 'package:flutter_open_scad/flutter_open_scad.dart';
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
