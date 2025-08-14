import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for creating or selecting a project.
class SelectProjectScreen extends ConsumerWidget {
  /// Create an instance.
  const SelectProjectScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) =>
      SimpleScaffold(
        title: 'Project Selection',
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                autofocus: true,
                onPressed: () {},
                icon: const Icon(Icons.add),
                tooltip: 'Create a new project',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.file_open),
                tooltip: 'Open an existing project',
              ),
            ],
          ),
        ),
      );
}
