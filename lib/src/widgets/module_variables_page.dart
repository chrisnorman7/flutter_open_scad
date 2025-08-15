import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The page which shows module variables.
class ModuleVariablesPage extends ConsumerWidget {
  /// Create an instance.
  const ModuleVariablesPage({
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
    final variables = ref.watch(
      moduleVariablesProvider(projectFilename, moduleId),
    );
    if (variables.isEmpty) {
      return const CenterText(
        text: 'This module has no variables.',
        autofocus: true,
      );
    }
    return ListView.builder(
      itemBuilder: (final context, final index) {
        final variable = variables[index];
        return ListTile(
          autofocus: index == 0,
          title: Text(variable.name),
          subtitle: Text('${variable.defaultValue}'),
          onTap: () {},
        );
      },
      itemCount: variables.length,
      shrinkWrap: true,
    );
  }
}
