import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';

/// A form field for selecting a variable.
class VariableFormField extends StatelessWidget {
  /// Create an instance.
  const VariableFormField({
    required this.name,
    required this.variableId,
    required this.variables,
    required this.onChanged,
    this.value,
    this.autofocus = false,
    super.key,
  });

  /// The name of the field.
  final String name;

  /// The ID of the variable which is being edited.
  ///
  /// The variable with id [variableId] will be excluded from [variables].
  final String variableId;

  /// The variables to show.
  final List<ModuleVariable> variables;

  /// What to do when the value changes.
  final ValueChanged<String?> onChanged;

  /// The current variable.
  final ModuleVariable? value;

  /// Whether this form field should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => FormBuilderDropdown<String?>(
    name: name,
    items: [
      ...variables.map(
        (final e) => DropdownMenuItem(
          value: e.id,
          enabled: e.id != variableId,
          child: Text(e.name),
        ),
      ),
      const DropdownMenuItem(child: Text('Manual')),
    ],
    autofocus: autofocus,
    initialValue: value?.id,
    onChanged: onChanged,
  );
}
