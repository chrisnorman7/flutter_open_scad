import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_open_scad/src/json/project_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// An action which creates a new module for a given [Project].
class NewModulePerformableAction extends PerformableAction {
  /// Create an instance.
  NewModulePerformableAction({
    required final WidgetRef ref,
    required final String filename,
  }) : super(
         name: 'New Module',
         invoke: () {
           final projectContext = ref.read(projectProvider(filename));
           final project = projectContext.project;
           project.modules.add(ProjectModule(id: newId(), shapes: []));
           projectContext.save(ref);
         },
         activator: CrossPlatformSingleActivator(LogicalKeyboardKey.keyM),
       );
}
