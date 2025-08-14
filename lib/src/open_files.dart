import 'dart:io';

import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A class to store [openFiles].
class OpenFiles {
  /// Create an instance.
  const OpenFiles(this.filenames);

  /// The names of the files which are open.
  final List<String> filenames;

  /// The open files from [filenames].
  List<File> get openFiles => filenames.map(File.new).toList();

  /// Save the [openFiles] list.
  Future<void> save() async {
    final names = openFiles
        .where((final file) => file.existsSync())
        .map((final file) => file.path)
        .toList();
    final preferences = SharedPreferencesAsync();
    await preferences.setStringList(openFilesKey, names);
  }
}
