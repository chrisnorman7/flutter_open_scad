import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for editing a square.
class EditSquareScreen extends ConsumerWidget {
  /// Create an instance.
  const EditSquareScreen({
    required this.projectFilename,
    required this.moduleId,
    required this.shapeId,
    super.key,
  });

  /// The name of the file which holds the project where the module which
  /// contains the shape is stored.
  final String projectFilename;

  /// The ID of the module which contains the shape.
  final String moduleId;

  /// ID of the circle to edit.
  final String shapeId;

  /// Build a widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectProvider(projectFilename));
    final shape = ref.watch(
      moduleShapeProvider(projectFilename, moduleId, shapeId),
    );
    final shapeType = shape.type;
    assert(
      shapeType == ShapeType.square,
      // ignore: lines_longer_than_80_chars
      'The shape was not a square: Project filename: $projectFilename, module ID: ${moduleId}Id, shape ID: $shapeId, type ${shapeType.name}',
    );
    final arguments = SquareArguments.fromJson(shape.arguments);
    final key = GlobalKey<FormBuilderState>();
    return PopScope(
      onPopInvokedWithResult: (final didPop, final result) {
        shape.arguments = arguments.toJson();
        projectContext.save(ref);
      },
      child: Cancel(
        child: SimpleScaffold(
          title: 'Edit ${shape.getName()}',
          body: FormBuilder(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ArgumentValueFormField(
                    projectFilename: projectFilename,
                    moduleId: moduleId,
                    argumentValue: arguments.x,
                    onDone: (final value) => arguments.x = value,
                    label: 'X',
                    autofocus: true,
                  ),
                  ArgumentValueFormField(
                    projectFilename: projectFilename,
                    moduleId: moduleId,
                    argumentValue: arguments.y,
                    onDone: (final value) => arguments.y = value,
                    label: 'Y',
                  ),
                  FormBuilderCheckbox(
                    name: 'centre',
                    title: const Text('Centre'),
                    initialValue: arguments.centre,
                    onChanged: (final value) =>
                        arguments.centre = value ?? false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
