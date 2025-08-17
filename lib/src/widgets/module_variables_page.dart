import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
    final variables = ref.watch(
      moduleVariablesProvider(projectFilename, moduleId),
    );
    if (variables.isEmpty) {
      return const CenterText(
        text: 'This module has no variables.',
        autofocus: true,
      );
    }
    final formKey = GlobalKey<FormBuilderState>();
    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < variables.length; i++)
              () {
                final variable = variables[i];
                return FormBuilderTextField(
                  name: variable.id,
                  autofocus: i == 0,
                  decoration: InputDecoration(labelText: variable.name),
                  initialValue: variable.defaultValue.toStringAsFixed(5),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                  valueTransformer: (final value) =>
                      value == null || value.isEmpty
                      ? variable.defaultValue
                      : double.parse(value),
                );
              }(),
            IconButton(
              onPressed: () {
                formKey.currentState?.saveAndValidate();
                print(formKey.currentState?.value);
              },
              icon: const Icon(Icons.save),
              tooltip: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
