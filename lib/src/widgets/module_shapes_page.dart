import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
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
    final projectContext = ref.watch(projectProvider(projectFilename));
    final module = ref.watch(projectModuleProvider(projectFilename, moduleId));
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
        return PerformableActionsListTile(
          actions: [
            PerformableAction(
              name: 'Delete Shape',
              invoke: () => context.showConfirmMessage(
                message: 'Are you sure you want to delete this shape?',
                noLabel: 'Cancel',
                title: confirmDelete,
                yesLabel: 'Delete',
                yesCallback: () {
                  module.shapes.removeWhere((final s) => s.id == shape.id);
                  projectContext.save(ref);
                },
              ),
              activator: deleteShortcut,
            ),
          ],
          autofocus: index == 0,
          title: Text(shape.type.name.sentenceCase),
          onTap: () => context.pushWidgetBuilder((_) {
            switch (shape.type) {
              case ShapeType.circle:
                return EditCircleScreen(
                  projectFilename: projectFilename,
                  moduleId: moduleId,
                  shapeId: shape.id,
                );
              case ShapeType.square:
                return EditSquareScreen(
                  projectFilename: projectFilename,
                  moduleId: moduleId,
                  shapeId: shape.id,
                );
              case ShapeType.cube:
                return EditCubeScreen(
                  projectFilename: projectFilename,
                  moduleId: moduleId,
                  shapeId: shape.id,
                );
              case ShapeType.cylinder:
                return EditCylinderScreen(
                  projectFilename: projectFilename,
                  moduleId: moduleId,
                  shapeId: shape.id,
                );
              case ShapeType.sphere:
                return EditSphereScreen(
                  projectFilename: projectFilename,
                  moduleId: moduleId,
                  shapeId: shape.id,
                );
              case ShapeType.polygon:
                return EditPolygonScreen(
                  projectFilename: projectFilename,
                  moduleId: moduleId,
                  shapeId: shape.id,
                );
              case ShapeType.polyhedron:
                return EditPolyhedronScreen(
                  projectFilename: projectFilename,
                  moduleId: moduleId,
                  shapeId: shape.id,
                );
              case ShapeType.module:
                return EditModuleReferenceScreen(
                  projectFilename: projectFilename,
                  moduleId: moduleId,
                  shapeId: shape.id,
                );
            }
          }),
        );
      },
      itemCount: shapes.length,
      shrinkWrap: true,
    );
  }
}
