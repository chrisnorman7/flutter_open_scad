import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;

/// The main screen of the application.
class MainScreen extends ConsumerWidget {
  /// Create an instance.
  const MainScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(openFilesProvider);
    return value.when(
      data: (final files) {
        if (files.isEmpty) {
          return const SelectProjectScreen();
        } else if (files.length == 1) {
          final file = files.single;
          return SimpleScaffold(
            title: path.basename(file.path),
            body: ProjectScreen(file.path),
          );
        }
        return TabbedScaffold(
          tabs: files
              .map(
                (final file) => TabbedScaffoldTab(
                  title: path.basename(file.path),
                  icon: Text(file.path),
                  child: ProjectScreen(file.path),
                ),
              )
              .toList(),
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }
}
