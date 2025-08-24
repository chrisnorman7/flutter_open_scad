import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

/// A screen for editing a module with the given [moduleId] in the project with
/// the given [projectFilename].
class EditModuleScreen extends ConsumerWidget {
  /// Create an instance.
  const EditModuleScreen({
    required this.projectFilename,
    required this.moduleId,
    super.key,
  });

  /// The filename where the project lives.
  final String projectFilename;

  /// The ID of the module to edit.
  final String moduleId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    const shapeTypes = ShapeType.values;
    final module = ref.watch(projectModuleProvider(projectFilename, moduleId));
    final projectContext = ref.watch(projectProvider(projectFilename));
    final newShapeActions = PerformableActionsContext.fromActions([
      for (var i = 0; i < shapeTypes.length; i++)
        PerformableAction(
          name: shapeTypes[i].name.sentenceCase,
          invoke: () {
            final shapeType = shapeTypes[i];
            if (shapeType == ShapeType.module) {
              context.pushWidgetBuilder(
                (_) => SelectModule(
                  filename: projectFilename,
                  onDone: (final value) {
                    module.shapes.add(
                      Shape(
                        id: newId(),
                        type: ShapeType.module,
                        arguments: ModuleArguments(
                          id: value.id,
                          arguments: {},
                        ).toJson(),
                      ),
                    );
                    projectContext.save(ref);
                  },
                  moduleId: module.id,
                ),
              );
              return;
            } else {
              module.shapes.add(
                Shape(
                  id: newId(),
                  type: shapeType,
                  arguments: switch (shapeType) {
                    ShapeType.circle => CircleArguments().toJson(),
                    ShapeType.square => SquareArguments().toJson(),
                    ShapeType.cube => CubeArguments().toJson(),
                    ShapeType.cylinder => CylinderArguments().toJson(),
                    ShapeType.sphere => SphereArguments().toJson(),
                    ShapeType.module => throw UnimplementedError(),
                  },
                ),
              );
              projectContext.save(ref);
            }
          },
          activator: CrossPlatformSingleActivator(switch (shapeTypes[i]) {
            ShapeType.circle => LogicalKeyboardKey.keyC,
            ShapeType.square => LogicalKeyboardKey.keyS,
            ShapeType.cube => LogicalKeyboardKey.keyU,
            ShapeType.cylinder => LogicalKeyboardKey.keyY,
            ShapeType.sphere => LogicalKeyboardKey.keyP,
            ShapeType.module => LogicalKeyboardKey.keyM,
          }, shift: true),
        ),
    ]);
    return Cancel(
      child: TabbedScaffold(
        tabs: [
          TabbedScaffoldTab(
            title: '${module.name} Shapes',
            icon: const Text('The shapes in this module'),
            child: CallbackShortcuts(
              bindings: newShapeActions.bindings,
              child: ModuleShapesPage(
                projectFilename: projectFilename,
                moduleId: moduleId,
              ),
            ),
            floatingActionButton: Semantics(
              customSemanticsActions: newShapeActions.customSemanticActions,
              child: MenuAnchor(
                menuChildren: newShapeActions.menuChildren,
                builder: (final context, final controller, final child) =>
                    NewButton(
                      onPressed: controller.toggle,
                      tooltip: 'New shape',
                    ),
              ),
            ),
          ),
          TabbedScaffoldTab(
            title: '${module.name} Variables',
            icon: const Text('The variables in this project'),
            child: CommonShortcuts(
              newCallback: () => _createVariable(ref),
              child: ModuleVariablesPage(
                projectFilename: projectFilename,
                moduleId: moduleId,
              ),
            ),
            floatingActionButton: NewButton(
              onPressed: () => _createVariable(ref),
              tooltip: 'New Variable',
            ),
          ),
        ],
      ),
    );
  }

  /// Create a new variable.
  void _createVariable(final WidgetRef ref) {
    final module = ref.read(projectModuleProvider(projectFilename, moduleId));
    final variable = ModuleVariable(id: newId());
    module.variables.add(variable);
    ref.read(projectProvider(projectFilename)).save(ref);
    ref.context.pushWidgetBuilder(
      (_) => EditVariableScreen(
        projectFilename: projectFilename,
        moduleId: moduleId,
        variableId: variable.id,
      ),
    );
  }
}
