import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

/// A screen for editing a module reference.
class EditModuleReferenceScreen extends ConsumerWidget {
  /// Create an instance.
  const EditModuleReferenceScreen({
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
      shapeType == ShapeType.module,
      // ignore: lines_longer_than_80_chars
      'The shape was not a module: Project filename: $projectFilename, module ID: ${moduleId}Id, shape ID: $shapeId, type ${shapeType.name}',
    );
    final json = shape.arguments;
    final arguments = ModuleArguments.fromJson(json);
    final otherModules = projectContext.project.modules
        .where((final m) => m.id != moduleId)
        .toList();
    final currentModule = ref.watch(
      projectModuleProvider(projectFilename, arguments.id),
    );
    return SimpleScaffold(
      title: 'Edit Circle',
      body: ListView(
        shrinkWrap: true,
        children: [
          PerformableActionsListTile(
            actions: otherModules
                .map(
                  (final m) => PerformableAction(
                    name: m.name,
                    invoke: () {
                      arguments.id = m.id;
                      arguments.arguments.clear();
                      projectContext.save(ref);
                    },
                    checked: m.id == arguments.id,
                  ),
                )
                .toList(),
            autofocus: true,
            title: const Text('Module'),
            subtitle: Text(currentModule.name),
          ),
          ...currentModule.variables.map(
            (final variable) => ListTile(
              title: Text(variable.name),
              subtitle: Text(
                '${arguments.arguments[variable.id] ?? variable.defaultValue}',
              ),
              onTap: () => context.pushWidgetBuilder(
                (final innerContext) => GetText(
                  onDone: (final value) {
                    innerContext.pop();
                    arguments.arguments[variable.id] = double.parse(value);
                    projectContext.save(ref);
                  },
                  labelText: variable.name,
                  text:
                      arguments.arguments[variable.id]?.toStringAsFixed(5) ??
                      variable.defaultValue.toStringAsFixed(5),
                  title: 'Set Variable Value',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
