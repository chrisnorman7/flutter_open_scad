import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final commonActions = [
      PerformableAction(
        name: 'New Project',
        invoke: () => createProject(ref),
        activator: CrossPlatformSingleActivator(LogicalKeyboardKey.keyN),
      ),
      PerformableAction(
        name: 'Open Project',
        invoke: () => openProject(ref),
        activator: CrossPlatformSingleActivator(LogicalKeyboardKey.keyO),
      ),
    ];
    final value = ref.watch(openFilesProvider);
    return value.when(
      data: (final openFiles) {
        final files = openFiles.openFiles;
        if (files.isEmpty) {
          return const SelectProjectScreen();
        } else if (files.length == 1) {
          final file = files.single;
          final actionsContext = PerformableActionsContext.fromActions([
            ...commonActions,
            CloseProjectPerformableAction(ref: ref, filename: file.path),
          ]);
          return CallbackShortcuts(
            bindings: actionsContext.bindings,
            child: SimpleScaffold(
              actions: [MenuButton(menuChildren: actionsContext.menuChildren)],
              title: path.basename(file.path),
              body: ProjectPage(file.path),
            ),
          );
        }
        return TabbedScaffold(
          tabs: files.map((final file) {
            final actionsContext = PerformableActionsContext.fromActions([
              ...commonActions,
              CloseProjectPerformableAction(ref: ref, filename: file.path),
            ]);
            return TabbedScaffoldTab(
              actions: [MenuButton(menuChildren: actionsContext.menuChildren)],
              title: file.path,
              icon: Text(path.basename(file.path)),
              child: CallbackShortcuts(
                bindings: actionsContext.bindings,
                child: ProjectPage(file.path),
              ),
            );
          }).toList(),
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }
}
