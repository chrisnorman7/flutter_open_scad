import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The action for closing projects.
class CloseProjectPerformableAction extends PerformableAction {
  /// Create an instance.
  CloseProjectPerformableAction({
    required final WidgetRef ref,
    required final String filename,
  }) : super(
         name: 'Close Project',
         invoke: () async {
           final openFiles = await ref.read(openFilesProvider.future);
           openFiles.filenames.remove(filename);
           await openFiles.save();
           ref.invalidate(openFilesProvider);
         },
         activator: CrossPlatformSingleActivator(LogicalKeyboardKey.keyW),
       );
}
