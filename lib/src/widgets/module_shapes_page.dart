import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/src/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

/// The page which shows module shapes.
class ModuleShapesPage extends ConsumerWidget {
  /// Create an instance.
  const ModuleShapesPage({
    required this.projectFilename,
    required this.moduleId,
    super.key,
  });

  /// The filename where the project lives.
  final String projectFilename;

  /// The ID of the module to edit.
  final String moduleId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final shapes = ref.watch(moduleShapesProvider(projectFilename, moduleId));
    if (shapes.isEmpty) {
      return const CenterText(
        text: 'This module has no shapes.',
        autofocus: true,
      );
    }
    return ListView.builder(
      itemBuilder: (final context, final index) {
        final shape = shapes[index];
        return ListTile(
          autofocus: index == 0,
          title: Text(shape.type.name.sentenceCase),
          onTap: () {},
        );
      },
      itemCount: shapes.length,
      shrinkWrap: true,
    );
  }
}
