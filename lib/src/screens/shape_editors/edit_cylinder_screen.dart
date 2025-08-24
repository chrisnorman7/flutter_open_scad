import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return PopScope(
      onPopInvokedWithResult: (final didPop, final result) {
        shape.arguments = arguments.toJson();
        projectContext.save(ref);
      },
      child: Cancel(
        child: SimpleScaffold(
          actions: [
            ModuleConfigurationButton(
              value: ModuleConfiguration(
                fs: arguments.fs,
                fa: arguments.fa,
                fn: arguments.fn,
              ),
              onChanged: (final value) {
                arguments
                  ..fs = value.fs
                  ..fa = value.fa
                  ..fn = value.fn;
                shape.arguments = arguments.toJson();
                projectContext.save(ref);
              },
            ),
          ],
          title: 'Edit ${shape.getName()}',
          body: FormBuilder(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ArgumentValueFormField(
                    autofocus: true,
                    projectFilename: projectFilename,
                    moduleId: moduleId,
                    argumentValue: arguments.height,
                    onDone: (final value) {
                      arguments.height = value;
                      projectContext.save(ref);
                    },
                    label: 'Height',
                  ),
                  EnumFormField(
                    values: CylinderEnds.values,
                    initialValue: arguments.ends,
                    labelText: 'End Linking',
                    onChanged: (final value) {
                      arguments.ends = value;
                      projectContext.save(ref);
                    },
                  ),
                  FormBuilderCheckbox(
                    name: 'centre',
                    title: const Text('Centre'),
                    initialValue: arguments.centre,
                  ),
                  ArgumentValueFormField(
                    projectFilename: projectFilename,
                    moduleId: moduleId,
                    argumentValue: arguments.size1,
                    onDone: (final value) {
                      arguments.size1 = value;
                      projectContext.save(ref);
                    },
                    label: 'Size 1',
                  ),
                  EnumFormField(
                    values: SizeType.values,
                    initialValue: arguments.size1Type,
                    labelText: 'Type of Size 1',
                    onChanged: (final value) {
                      arguments.size1Type = value;
                      projectContext.save(ref);
                    },
                  ),
                  ArgumentValueFormField(
                    projectFilename: projectFilename,
                    moduleId: moduleId,
                    argumentValue: arguments.size2,
                    onDone: (final value) {
                      arguments.size2 = value;
                      projectContext.save(ref);
                    },
                    label: 'Size 2',
                  ),
                  EnumFormField(
                    values: SizeType.values,
                    initialValue: arguments.size2Type,
                    labelText: 'Type of Size 2',
                    onChanged: (final value) {
                      arguments.size2Type = value;
                      projectContext.save(ref);
                    },
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
