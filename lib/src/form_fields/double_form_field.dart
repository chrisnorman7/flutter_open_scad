import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

/// A form field for editing a [double] value.
class DoubleFormField extends StatelessWidget {
  /// Create an instance.
  const DoubleFormField({
    required this.name,
    required this.initialValue,
    required this.labelText,
    this.autofocus = false,
    super.key,
  });

  /// The name of the field.
  final String name;

  /// The initial value of the field.
  final double initialValue;

  /// The label text for the field.
  final String labelText;

  /// Whether the field should autofocus.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => FormBuilderTextField(
    name: name,
    autofocus: autofocus,
    decoration: InputDecoration(labelText: labelText),
    initialValue: initialValue.toStringAsFixed(5),
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.numeric(),
    ]),
    valueTransformer: (final value) =>
        value == null ? initialValue : double.tryParse(value) ?? initialValue,
  );
}
