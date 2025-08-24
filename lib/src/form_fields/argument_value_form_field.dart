import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A form field which allows editing a [argumentValue].
///
/// When the edit has finished, [onDone] is called.
class ArgumentValueFormField extends ConsumerStatefulWidget {
  /// Create an instance.
  const ArgumentValueFormField({
    required this.projectFilename,
    required this.moduleId,
    required this.argumentValue,
    required this.onDone,
    required this.label,
    this.autofocus = false,
    super.key,
  });

  /// The filename of the project.
  final String projectFilename;

  /// The ID of the module which [argumentValue] belongs to.
  ///
  /// The [moduleId] is used to infer both variables and variable values.
  final String moduleId;

  /// The current value of the argument.
  final ArgumentValue argumentValue;

  /// The function to call when [argumentValue] has been modified.
  final ValueChanged<ArgumentValue> onDone;

  /// The label for the form field.
  final String label;

  /// Whether the form field should be autofocused.
  final bool autofocus;

  @override
  ConsumerState<ArgumentValueFormField> createState() =>
      _ArgumentValueFormFieldState();
}

class _ArgumentValueFormFieldState
    extends ConsumerState<ArgumentValueFormField> {
  /// The controller for the text field.
  late final TextEditingController _controller;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final module = ref.watch(
      projectModuleProvider(widget.projectFilename, widget.moduleId),
    );
    final variables = module.availableVariables;
    final variableId = widget.argumentValue.variableId;
    final variable = variableId == null
        ? null
        : variables.findVariable(variableId);
    _controller.text = widget.argumentValue.value.toStringAsFixed(5);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.label),
        MenuAnchor(
          menuChildren: [
            for (var i = 0; i <= variables.length; i++)
              () {
                if (i == variables.length) {
                  return MenuItemButton(
                    autofocus: widget.argumentValue.variableId == null,
                    child: const Text('Custom'),
                    onPressed: () {
                      widget.onDone(
                        ArgumentValue(value: widget.argumentValue.value),
                      );
                    },
                  );
                }
                final variable = variables[i];
                final value = module.getVariableValue(variable);
                return MenuItemButton(
                  autofocus: variable.id == widget.argumentValue.variableId,
                  key: ValueKey(variable.id),
                  onPressed: () {
                    widget.onDone(
                      ArgumentValue(
                        variableId: variable.id,
                        value: widget.argumentValue.value,
                      ),
                    );
                  },
                  child: Text('${variable.name} = $value'),
                );
              }(),
          ],
          builder: (final context, final controller, final child) => TextButton(
            onPressed: controller.toggle,
            autofocus: widget.autofocus,
            child: Text(variable?.name ?? 'Custom'),
          ),
        ),
        if (variable == null)
          Flexible(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Literal value'),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (final string) {
                final value =
                    double.tryParse(string) ?? widget.argumentValue.value;
                widget.onDone(ArgumentValue(value: value));
              },
            ),
          ),
      ],
    );
  }
}
