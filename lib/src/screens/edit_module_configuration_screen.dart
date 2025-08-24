import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

/// A screen for editing module configuration.
class EditModuleConfigurationScreen extends StatelessWidget {
  /// Create an instance.
  const EditModuleConfigurationScreen({
    required this.value,
    required this.onChanged,
    super.key,
  });

  /// The module configuration to use.
  final ModuleConfiguration value;

  /// The function to call when [value] has been modified.
  final ValueChanged<ModuleConfiguration> onChanged;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Configuration',
        body: FormBuilder(
          initialValue: value.toJson(),
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DoubleFormField(
                  name: 'fa',
                  initialValue: value.fa,
                  labelText: r'$fa',
                ),
                DoubleFormField(
                  name: 'fs',
                  initialValue: value.fs,
                  labelText: r'$fs',
                ),
                FormBuilderTextField(
                  name: 'fn',
                  decoration: const InputDecoration(labelText: r'$fn'),
                  initialValue: '${value.fn}',
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.min(0),
                  ]),
                  valueTransformer: (final string) => string == null
                      ? value.fn
                      : int.tryParse(string) ?? value.fn,
                ),
                SaveButton(
                  onPressed: () {
                    if (formKey.currentState?.saveAndValidate() ?? false) {
                      final json =
                          formKey.currentState?.value ?? value.toJson();
                      onChanged(ModuleConfiguration.fromJson(json));
                      context.pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
