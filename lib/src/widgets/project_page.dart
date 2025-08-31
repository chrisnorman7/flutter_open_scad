import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

/// A screen which shows a single project.
class ProjectPage extends ConsumerWidget {
  /// Create an instance.
  const ProjectPage(this.filename, {super.key});

  /// The filename of the project.
  final String filename;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectProvider(filename));
    final project = projectContext.project;
    final modules = project.modules;
    if (modules.isEmpty) {
      return const CenterText(
        text: 'This project contains no modules.',
        autofocus: true,
      );
    }
    return ListView.builder(
      itemBuilder: (final context, final index) {
        final module = modules[index];
        return PerformableActionsListTile(
          actions: [
            PerformableAction(
              name: 'Rename Module',
              invoke: () => context.pushWidgetBuilder(
                (final innerContext) => GetText(
                  onDone: (final value) {
                    innerContext.pop();
                    module.name = value;
                    projectContext.save(ref);
                  },
                  labelText: 'Module name',
                  text: module.name,
                  title: 'Rename Module',
                ),
              ),
              activator: renameShortcut,
            ),
            PerformableAction(
              name: 'Copy code',
              invoke: () {
                module.getCode().copyToClipboard();
              },
              activator: CrossPlatformSingleActivator(
                LogicalKeyboardKey.keyC,
                shift: true,
              ),
            ),
            PerformableAction(
              name: 'Delete Module',
              invoke: () => context.showConfirmMessage(
                message: 'Really delete ${module.name}?',
                noLabel: 'Cancel',
                title: confirmDelete,
                yesCallback: () {
                  project.modules.removeWhere((final m) => m.id == module.id);
                  projectContext.save(ref);
                },
                yesLabel: 'Delete',
              ),
              activator: deleteShortcut,
            ),
          ],
          autofocus: index == 0,
          title: Text(module.name),
          subtitle: Text(module.thickness.name.sentenceCase),
          onTap: () => context.pushWidgetBuilder(
            (_) => EditModuleScreen(
              moduleId: module.id,
              projectFilename: filename,
            ),
          ),
        );
      },
      itemCount: modules.length,
      shrinkWrap: true,
    );
  }
}
