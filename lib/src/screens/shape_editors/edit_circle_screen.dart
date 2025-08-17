import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:recase/recase.dart';

/// A screen for editing a circle.
class EditCircleScreen extends ConsumerWidget {
  /// Create an instance.
  const EditCircleScreen({
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
      shapeType == ShapeType.circle,
      // ignore: lines_longer_than_80_chars
      'The shape was not a circle: Project filename: $projectFilename, module ID: ${moduleId}Id, shape ID: $shapeId, type ${shapeType.name}',
    );
    final arguments = CircleArguments.fromJson(shape.arguments);
    final formKey = GlobalKey<FormBuilderState>();
    const shapeTypes = SizeType.values;
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit ${shape.name ?? "Circle"}',
        body: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DoubleFormField(
                  name: 'size',
                  initialValue: arguments.size,
                  labelText: 'Size',
                  autofocus: true,
                ),
                FormBuilderDropdown(
                  name: 'sizeType',
                  items: [
                    for (var i = 0; i < shapeTypes.length; i++)
                      DropdownMenuItem(
                        value: shapeTypes[i],
                        child: Text(shapeTypes[i].name.sentenceCase),
                      ),
                  ],
                  decoration: const InputDecoration(labelText: 'Type of Size'),
                  initialValue: arguments.sizeType,
                  valueTransformer: (final value) => value?.name,
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
                      final testArguments = CircleArguments.fromJson(json);
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
