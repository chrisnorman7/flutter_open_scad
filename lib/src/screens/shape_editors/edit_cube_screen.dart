import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for editing a cube.
class EditCubeScreen extends ConsumerWidget {
  /// Create an instance.
  const EditCubeScreen({
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
    final shape = ref.watch(
      moduleShapeProvider(projectFilename, moduleId, shapeId),
    );
    final shapeType = shape.type;
    assert(
      shapeType == ShapeType.cube,
      // ignore: lines_longer_than_80_chars
      'The shape was not a cube: Project filename: $projectFilename, module ID: ${moduleId}Id, shape ID: $shapeId, type ${shapeType.name}',
    );
    final arguments = CubeArguments.fromJson(shape.arguments);
    final formKey = GlobalKey<FormBuilderState>();
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit ${shape.name ?? "Cube"}',
        body: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DoubleFormField(
                  name: 'x',
                  initialValue: arguments.x,
                  labelText: 'X',
                  autofocus: true,
                ),
                DoubleFormField(
                  name: 'y',
                  initialValue: arguments.y,
                  labelText: 'Y',
                ),
                DoubleFormField(
                  name: 'z',
                  initialValue: arguments.z,
                  labelText: 'Z',
                ),
                FormBuilderCheckbox(
                  name: 'centre',
                  title: const Text('Centre'),
                  initialValue: arguments.centre,
                ),
                SaveButton(
                  onPressed: () {
                    if (formKey.currentState?.saveAndValidate() ?? false) {
                      final json =
                          formKey.currentState?.value ?? arguments.toJson();
                      final testArguments = CubeArguments.fromJson(json);
                      shape.arguments = testArguments.toJson();
                      context.pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
