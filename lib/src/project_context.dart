import 'dart:convert';
import 'dart:io';

import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _encoder = JsonEncoder.withIndent('  ');

/// A class which provides context for a [project].
class ProjectContext {
  /// Create an instance.
  const ProjectContext({required this.file, required this.project});

  /// The file where this project was loaded from.
  final File file;

  /// The project which is contained in [file].
  final Project project;

  /// Save [project] to [file].
  void save(final WidgetRef ref) {
    final source = _encoder.convert(project.toJson());
    file.writeAsStringSync(source);
    ref.invalidate(projectProvider(file.path));
  }
}
