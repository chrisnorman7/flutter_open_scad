import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
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
    final module = ref.watch(projectModuleProvider(projectFilename, moduleId));
    final allVariables = module.availableVariables;
    return ListView.builder(
      itemBuilder: (final context, final index) {
        final variable = variables[index];

        String getDescription() {
          final firstVariableId = variable.firstVariableId;
          final secondVariableId = variable.secondVariableId;
          final variable1 = firstVariableId == null
              ? null
              : allVariables.firstWhere((final v) => v.id == firstVariableId);
          final variable2 = secondVariableId == null
              ? null
              : allVariables.firstWhere((final v) => v.id == secondVariableId);
          final x = variable1?.name ?? (variable.firstValue.toStringAsFixed(5));
          final y =
              variable2?.name ?? (variable.secondValue.toStringAsFixed(5));
          switch (variable.operation) {
            case VariableOperation.verbatim:
              return x;
            case VariableOperation.add:
              return '$x + $y';
            case VariableOperation.subtract:
              return '$x - $y';
            case VariableOperation.multiply:
              return '$x * $y';
            case VariableOperation.divide:
              return '$x / $y';
            case VariableOperation.power:
              return '$x ^ $y';
            case VariableOperation.cos:
              return 'cos($x)';
            case VariableOperation.sin:
              return 'sin($x)';
            case VariableOperation.tan:
              return 'tan($x)';
            case VariableOperation.acos:
              return 'acos($x)';
            case VariableOperation.asin:
              return 'asin($x)';
            case VariableOperation.atan:
              return 'atan($x)';
          }
        }

        final value = module.getVariableValue(variable);
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
              activator: renameShortcut,
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
          subtitle: Text('${getDescription()} = $value'),
          onTap: () => context.pushWidgetBuilder(
            (final innerContext) => EditVariableScreen(
              projectFilename: projectFilename,
              moduleId: moduleId,
              variableId: variable.id,
            ),
          ),
        );
      },
      itemCount: variables.length,
      shrinkWrap: true,
    );
  }
}
