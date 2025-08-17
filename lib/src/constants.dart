import 'dart:convert';
import 'dart:io';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// The UUID generator to use.
const _uuid = Uuid();

/// Generate a new id.
String newId() => _uuid.v7();

/// The file extension for projects.
const projectFileExtension = '.fcad';

/// Create a new project.
Future<void> createProject(final WidgetRef ref) async {
  final filename = await FilePicker.platform.saveFile(
    allowedExtensions: [projectFileExtension],
    dialogTitle: 'Create Project',
    initialDirectory: (await getApplicationDocumentsDirectory()).path,
    type: FileType.custom,
  );
  if (filename == null) {
    return;
  }
  final project = Project(modules: []);
  final String filePath;
  if (path.extension(filename) != projectFileExtension) {
    filePath = '$filename$projectFileExtension';
  } else {
    filePath = filename;
  }
  final file = File(filePath);
  ProjectContext(file: file, project: project).save(ref);
  final openFiles = await ref.read(openFilesProvider.future);
  openFiles.filenames.add(filePath);
  await openFiles.save();
  ref.invalidate(openFilesProvider);
}

/// Open an existing project.
Future<void> openProject(final WidgetRef ref) async {
  final results = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    allowedExtensions: [projectFileExtension],
    dialogTitle: 'Open Project File(s)',
    initialDirectory: (await getApplicationDocumentsDirectory()).path,
    type: FileType.custom,
  );
  final openFiles = await ref.read(openFilesProvider.future);
  for (final result in results?.files ?? <PlatformFile>[]) {
    final filename = result.path;
    if (filename == null) {
      continue;
    }
    try {
      if (openFiles.filenames.contains(filename)) {
        continue;
      }
      final file = File(filename);
      final source = file.readAsStringSync();
      final json = jsonDecode(source);
      Project.fromJson(json as Map<String, dynamic>);
      openFiles.filenames.add(filename);
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
  await openFiles.save();
  ref.invalidate(openFilesProvider);
}

/// The title for delete confirmation dialogues.
const confirmDelete = 'Delete Confirmation';

/// The hotkey for renaming things.
final renameShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyR);

/// A list of 2 dimensional shape types.
const shapeTypes2d = [ShapeType.circle, ShapeType.square, ShapeType.polygon];
