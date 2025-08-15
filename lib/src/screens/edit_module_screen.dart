import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for editing a module with the given [moduleId] in the project with
/// the given [projectFilename].
class EditModuleScreen extends ConsumerWidget {
  /// Create an instance.
  const EditModuleScreen({
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
  Widget build(final BuildContext context, final WidgetRef ref) =>
      TabbedScaffold(
        tabs: [
          TabbedScaffoldTab(
            title: 'Shapes',
            icon: const Text('The shapes in this module'),
            child: ModuleShapesPage(
              projectFilename: projectFilename,
              moduleId: moduleId,
            ),
          ),
          TabbedScaffoldTab(
            title: 'Variables',
            icon: const Text('The variables in this project'),
            child: ModuleVariablesPage(
              projectFilename: projectFilename,
              moduleId: moduleId,
            ),
          ),
        ],
      );
}
