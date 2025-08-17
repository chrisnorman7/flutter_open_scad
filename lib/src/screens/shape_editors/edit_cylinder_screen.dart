import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

/// A screen for editing a cylinder.
class EditCylinderScreen extends ConsumerWidget {
  /// Create an instance.
  const EditCylinderScreen({
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
      shapeType == ShapeType.cylinder,
      // ignore: lines_longer_than_80_chars
      'The shape was not a cylinder: Project filename: $projectFilename, module ID: ${moduleId}Id, shape ID: $shapeId, type ${shapeType.name}',
    );
    final arguments = CylinderArguments.fromJson(shape.arguments);
    final formKey = GlobalKey<FormBuilderState>();
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit ${shape.getName()}',
        body: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DoubleFormField(
                  name: 'height',
                  initialValue: arguments.height,
                  labelText: 'Height',
                  autofocus: true,
                ),
                EnumFormField(
                  name: 'ends',
                  values: CylinderEnds.values,
                  initialValue: arguments.ends,
                  labelText: 'End Linking',
                ),
                FormBuilderCheckbox(
                  name: 'centre',
                  title: const Text('Centre'),
                  initialValue: arguments.centre,
                ),
                DoubleFormField(
                  name: 'size1',
                  initialValue: arguments.size1,
                  labelText: 'Size 1',
                ),
                EnumFormField(
                  name: 'size1Type',
                  values: SizeType.values,
                  initialValue: arguments.size1Type,
                  labelText: 'Type of Size 1',
                ),
                DoubleFormField(
                  name: 'size2',
                  initialValue: arguments.size2,
                  labelText: 'Size 2',
                ),
                EnumFormField(
                  name: 'size2Type',
                  values: SizeType.values,
                  initialValue: arguments.size2Type,
                  labelText: 'Type of Size 2',
                ),
                DoubleFormField(
                  name: 'fa',
                  initialValue: arguments.fa,
                  labelText: r'$fa',
                ),
                DoubleFormField(
                  name: 'fs',
                  initialValue: arguments.fs,
                  labelText: r'$fs',
                ),
                FormBuilderTextField(
                  name: 'fn',
                  decoration: const InputDecoration(labelText: r'$fn'),
                  initialValue: '${arguments.fn}',
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.min(0),
                  ]),
                  valueTransformer: (final value) => value == null
                      ? arguments.fn
                      : int.tryParse(value) ?? arguments.fn,
                ),
                SaveButton(
                  onPressed: () {
                    if (formKey.currentState?.saveAndValidate() ?? false) {
                      final json =
                          formKey.currentState?.value ?? arguments.toJson();
                      final testArguments = CubeArguments.fromJson(json);
                      shape.arguments = testArguments.toJson();
                      projectContext.save(ref);
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
