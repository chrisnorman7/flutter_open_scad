import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

/// A widget which shows a not implemented message.
class NotImplemented extends StatelessWidget {
  /// Create an instance.
  const NotImplemented({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context) =>
      const CenterText(text: 'Not implemented yet.', autofocus: true);
}
