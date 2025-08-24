import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:recase/recase.dart';

/// A form field for selecting an [Enum] value.
class EnumFormField<T extends Enum> extends StatelessWidget {
  /// Create an instance.
  const EnumFormField({
    required this.values,
    required this.initialValue,
    required this.labelText,
    required this.onChanged,
    super.key,
  });

  /// The values that can be selected from.
  final List<T> values;

  /// The initial value of the field.
  final T initialValue;

  /// The label text for the field.
  final String labelText;

  /// The function to call when [initialValue] changes.
  final ValueChanged<T> onChanged;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => FormBuilderDropdown<T>(
    name: labelText.snakeCase,
    items: [
      for (var i = 0; i < values.length; i++)
        DropdownMenuItem(
          value: values[i],
          child: Text(values[i].name.sentenceCase),
        ),
    ],
    decoration: InputDecoration(labelText: labelText),
    initialValue: initialValue,
    onChanged: (final value) => onChanged.call(value!),
  );
}
