import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for editing a polygon.
class EditPolygonScreen extends ConsumerWidget {
  /// Create an instance.
  const EditPolygonScreen({
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
      shapeType == ShapeType.polygon,
      // ignore: lines_longer_than_80_chars
      'The shape was not a polygon: Project filename: $projectFilename, module ID: ${moduleId}Id, shape ID: $shapeId, type ${shapeType.name}',
    );
    final arguments = PolygonArguments.fromJson(shape.arguments);
    final points = arguments.points;
    final paths = arguments.paths;
    return Cancel(
      child: TabbedScaffold(
        tabs: [
          TabbedScaffoldTab(
            title: 'Points',
            icon: const Text('The points in this polygon'),
            child: ListView.builder(
              itemBuilder: (final context, final index) {
                final point = points[index];
                return PerformableActionsListTile(
                  actions: const [],
                  autofocus: index == 0,
                  title: Text(point.name ?? 'Point ${index + 1}'),
                  subtitle: Text('${point.x}, ${point.y}'),
                  onTap: () {},
                );
              },
              itemCount: points.length,
              shrinkWrap: true,
            ),
          ),
          TabbedScaffoldTab(
            title: 'Paths',
            icon: const Text('The paths in this polygon'),
            child: paths.isEmpty
                ? const CenterText(
                    text: 'No path have been created.',
                    autofocus: true,
                  )
                : ListView.builder(
                    itemBuilder: (final context, final index) {
                      final path = paths[index];
                      return PerformableActionsListTile(
                        actions: const [],
                        autofocus: index == 0,
                        title: Text(path.name),
                        subtitle: Text('${path.pointIndexes.length}'),
                        onTap: () {},
                      );
                    },
                    itemCount: paths.length,
                    shrinkWrap: true,
                  ),
          ),
        ],
      ),
    );
  }
}
