import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for editing a cylinder.
class EditCylinderScreen extends ConsumerWidget {
  /// Create an instance.
  const EditCylinderScreen({
    required this.projectFilename,
    required this.moduleId,
    required this.shapeId,
    super.key,
  });

  /// The name of the file which holds the project where the module which
  /// contains the shape is stored.
  final String projectFilename;

  /// The ID of the module which contains the shape.
  final String moduleId;

  /// ID of the circle to edit.
  final String shapeId;

  /// Build a widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final shape = ref.watch(
      moduleShapeProvider(projectFilename, moduleId, shapeId),
    );
    final shapeType = shape.type;
    assert(
      shapeType == ShapeType.circle,
      // ignore: lines_longer_than_80_chars
      'The shape was not cylinder circle: Project filename: $projectFilename, module ID: ${moduleId}Id, shape ID: $shapeId, type ${shapeType.name}',
    );
    return const SimpleScaffold(title: 'Edit Cylinder', body: NotImplemented());
  }
}
