import 'dart:convert';
import 'dart:io';

import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

/// The preferences key where the preferences are stored.
const appPreferencesKey = 'flutter_open_scad_app_preferences';

/// Provide the app preferences.
@riverpod
Future<AppPreferences> appPreferences(final Ref ref) async {
  final preferences = SharedPreferencesAsync();
  final source = await preferences.getString(appPreferencesKey);
  if (source == null) {
    return AppPreferences();
  }
  final json = jsonDecode(source);
  return AppPreferences.fromJson(json as Map<String, dynamic>);
}

/// Provide the list of all open files.
@riverpod
Future<List<File>> openFiles(final Ref ref) async {
  final preferences = await ref.watch(appPreferencesProvider.future);
  return preferences.openFiles
      .map(File.new)
      .where((final file) => file.existsSync())
      .toList();
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
