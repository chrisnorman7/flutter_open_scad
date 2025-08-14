import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';

/// A menu button.
class MenuButton extends StatelessWidget {
  /// Create an instance.
  const MenuButton({required this.menuChildren, super.key});

  /// The menu children.
  final List<Widget> menuChildren;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => MenuAnchor(
    menuChildren: menuChildren,
    builder: (final context, final controller, final child) => IconButton(
      onPressed: controller.toggle,
      icon: const Icon(Icons.more_vert),
      tooltip: 'Menu',
    ),
  );
}
