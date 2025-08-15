import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/src/json/project_module.dart';
import 'package:flutter_open_scad/src/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for selecting a module.
class SelectModule extends ConsumerWidget {
  /// Create an instance.
  const SelectModule({
    required this.filename,
    required this.onDone,
    this.moduleId,
    this.title = 'Select Module',
    this.noModulesLabel = 'There are no modules to show.',
    super.key,
  });

  /// The name of the file where the project is stored.
  final String filename;

  /// The function to call when a module has been selected.
  final ValueChanged<ProjectModule> onDone;

  /// The ID of the current module.
  final String? moduleId;

  /// The title of the [SimpleScaffold].
  final String title;

  /// The string to show when there are no modules to show.
  final String noModulesLabel;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectProvider(filename));
    final modules = projectContext.project.modules
        .where((final m) => m.id != moduleId)
        .toList();
    return Cancel(
      child: SimpleScaffold(
        title: title,
        body: modules.isEmpty
            ? CenterText(text: noModulesLabel, autofocus: true)
            : ListView.builder(
                itemBuilder: (final context, final index) {
                  final module = modules[index];
                  return ListTile(
                    autofocus: index == 0,
                    title: Text(module.name),
                    onTap: () {
                      context.pop();
                      onDone(module);
                    },
                  );
                },
                itemCount: modules.length,
                shrinkWrap: true,
              ),
      ),
    );
  }
}
