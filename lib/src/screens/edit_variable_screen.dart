import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for modifying a variable.
class EditVariableScreen extends ConsumerWidget {
  /// Create an instance.
  const EditVariableScreen({
    required this.projectFilename,
    required this.moduleId,
    required this.variableId,
    super.key,
  });

  /// The name of the file which holds the project where the module which
  /// contains the shape is stored.
  final String projectFilename;

  /// The ID of the module which contains the shape.
  final String moduleId;

  /// The ID of the variable to edit.
  final String variableId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectProvider(projectFilename));
    final module = ref.watch(projectModuleProvider(projectFilename, moduleId));
    final variables = module.availableVariables;
    final variable = ref.watch(
      moduleVariableProvider(projectFilename, moduleId, variableId),
    );
    final formKey = GlobalKey<FormBuilderState>();
    final firstVariableId = variable.firstVariableId;
    final secondVariableId = variable.secondVariableId;
    final singleValueOperations = <VariableOperation>{
      VariableOperation.acos,
      VariableOperation.asin,
      VariableOperation.atan,
      VariableOperation.cos,
      VariableOperation.sin,
      VariableOperation.tan,
      VariableOperation.verbatim,
    };
    return CallbackShortcuts(
      bindings: {
        CrossPlatformSingleActivator(LogicalKeyboardKey.keyR): () =>
            _renameVariable(ref),
      },
      child: Cancel(
        child: SimpleScaffold(
          actions: [
            IconButton(
              onPressed: () => _renameVariable(ref),
              icon: const Icon(Icons.edit),
              tooltip: 'Rename Variable',
            ),
          ],
          title: 'Edit ${variable.name}',
          body: FormBuilder(
            key: formKey,
            initialValue: variable.toJson(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VariableFormField(
                    name: 'firstVariableId',
                    variableId: variable.id,
                    variables: variables,
                    onChanged: (final value) {
                      variable.firstVariableId = value;
                      projectContext.save(ref);
                    },
                    autofocus: true,
                    value: firstVariableId == null
                        ? null
                        : variables.requireVariable(firstVariableId),
                  ),
                  if (firstVariableId == null)
                    DoubleFormField(
                      name: 'firstValue',
                      initialValue: variable.firstValue,
                      labelText: 'First Value',
                    ),
                  EnumFormField(
                    name: 'operation',
                    values: VariableOperation.values,
                    initialValue: variable.operation,
                    labelText: 'Operation',
                    onChanged: (final value) {
                      variable.operation = value;
                      projectContext.save(ref);
                    },
                  ),
                  if (!singleValueOperations.contains(variable.operation)) ...[
                    VariableFormField(
                      name: 'secondVariableId',
                      variableId: variable.id,
                      variables: variables,
                      onChanged: (final value) {
                        variable.secondVariableId = value;
                        projectContext.save(ref);
                      },
                      autofocus: true,
                      value: secondVariableId == null
                          ? null
                          : variables.requireVariable(secondVariableId),
                    ),
                    if (secondVariableId == null)
                      DoubleFormField(
                        name: 'secondValue',
                        initialValue: variable.secondValue,
                        labelText: 'Second Value',
                      ),
                  ],
                  SaveButton(
                    onPressed: () {
                      if (formKey.currentState?.saveAndValidate() ?? false) {
                        final json = {
                          'id': variable.id,
                          ...(formKey.currentState?.value ?? variable.toJson()),
                        };
                        variable
                          ..firstValue = (json['firstValue'] as double?) ?? 1.0
                          ..firstVariableId = json['firstVariableId'] as String?
                          ..secondValue =
                              (json['secondValue'] as double?) ?? 1.0
                          ..secondVariableId =
                              json['secondVariableId'] as String?;
                        projectContext.save(ref);
                        context.pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Rename the variable.
  Future<void> _renameVariable(final WidgetRef ref) {
    final projectContext = ref.read(projectProvider(projectFilename));
    final variable = ref.read(
      moduleVariableProvider(projectFilename, moduleId, variableId),
    );
    return ref.context.pushWidgetBuilder(
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
    );
  }
}
