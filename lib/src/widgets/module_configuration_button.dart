import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';

/// A button to allow editing module configuration.
class ModuleConfigurationButton extends StatelessWidget {
  /// Create an instance.
  const ModuleConfigurationButton({
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
  Widget build(final BuildContext context) => IconButton(
    onPressed: () => context.pushWidgetBuilder(
      (_) => EditModuleConfigurationScreen(value: value, onChanged: onChanged),
    ),
    icon: const Icon(Icons.more_vert),
    tooltip: 'Module configuration',
  );
}
