import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
    final projectContext = ref.watch(projectProvider(projectFilename));
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
        return PerformableActionsListTile(
          actions: [
            PerformableAction(
              name: 'Rename Variable',
              invoke: () => context.pushWidgetBuilder(
                (final innerContext) => GetText(
                  onDone: (final value) {
                    innerContext.pop();
                    variable.name = value;
                    projectContext.save(ref);
                  },
                  labelText: 'Name',
                  text: variable.name,
                  title: 'Rename Variable',
                ),
              ),
              activator: CrossPlatformSingleActivator(LogicalKeyboardKey.keyR),
            ),
            PerformableAction(
              name: 'Delete Variable',
              invoke: () {
                variables.removeWhere((final v) => v.id == variable.id);
                projectContext.save(ref);
              },
              activator: deleteShortcut,
            ),
          ],
          autofocus: index == 0,
          title: Text(variable.name),
          subtitle: Text(variable.defaultValue.toStringAsFixed(5)),
          onTap: () => context.pushWidgetBuilder(
            (final innerContext) => GetText(
              onDone: (final value) {
                innerContext.pop();
                variable.defaultValue =
                    double.tryParse(value) ?? variable.defaultValue;
                projectContext.save(ref);
              },
              labelText: 'Default value',
              text: variable.defaultValue.toStringAsFixed(5),
              title: 'Default Value',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
              ]),
            ),
          ),
        );
      },
      itemCount: variables.length,
      shrinkWrap: true,
    );
  }
}
