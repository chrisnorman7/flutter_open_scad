import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_scad/src/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen which shows a single project.
class ProjectScreen extends ConsumerWidget {
  /// Create an instance.
  const ProjectScreen(this.filename, {super.key});

  /// The filename of the project.
  final String filename;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectProvider(filename));
    final project = projectContext.project;
    final modules = project.modules;
    return CallbackShortcuts(
      bindings: {
        CrossPlatformSingleActivator(LogicalKeyboardKey.keyW): () async {
          final openFiles = await ref.read(openFilesProvider.future);
          openFiles.filenames.remove(filename);
          await openFiles.save();
          ref.invalidate(openFilesProvider);
        },
      },
      child: Builder(
        builder: (_) {
          if (modules.isEmpty) {
            return const CenterText(
              text: 'This project contains no modules.',
              autofocus: true,
            );
          }
          return ListView.builder(
            itemBuilder: (final context, final index) {
              final module = modules[index];
              return ListTile(
                autofocus: index == 0,
                title: Text(module.name),
                subtitle: Text('${module.shapes.length}'),
                onTap: () {},
              );
            },
            itemCount: modules.length,
            shrinkWrap: true,
          );
        },
      ),
    );
  }
}
