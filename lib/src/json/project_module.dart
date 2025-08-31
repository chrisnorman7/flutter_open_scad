import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recase/recase.dart';

part 'project_module.g.dart';

/// Whether a module is flat or 3d.
enum ModuleThickness {
  /// The module contains only circles and squares.
  flat,

  /// The module contains 3d shapes.
  threeDimensional,
}

/// A module in a [Project].
@JsonSerializable()
class ProjectModule {
  /// Create an instance.
  ProjectModule({
    required this.id,
    required this.shapes,
    required this.variables,
    this.name = 'Untitled module',
  });

  /// Create an instance from a JSON object.
  factory ProjectModule.fromJson(final Map<String, dynamic> json) =>
      _$ProjectModuleFromJson(json);

  /// The ID of this module.
  final String id;

  /// THe name of this module.
  String name;

  /// The shapes in this module.
  final List<Shape> shapes;

  /// The variables available in this module.
  final List<ModuleVariable> variables;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ProjectModuleToJson(this);

  /// Returns `true` if all the shapes in [shapes] are circles or squares.
  ModuleThickness get thickness {
    for (final shape in shapes) {
      if (!shapeTypes2d.contains(shape.type)) {
        return ModuleThickness.threeDimensional;
      }
    }
    return ModuleThickness.flat;
  }

  /// Get all variables available in this module.
  ///
  /// This list includes [builtinVariables] and [variables].
  List<ModuleVariable> get availableVariables => [
    ...variables,
    ...builtinVariables.entries.map(
      (final e) => ModuleVariable(
        id: e.key,
        firstValue: e.value,
        name: e.key.sentenceCase,
      ),
    ),
  ];

  /// Get the value of [variable].
  double getVariableValue(final ModuleVariable variable) =>
      variable.getValue(availableVariables);

  /// A code-friendly name for this module.
  String get codeName => 'module_${id.snakeCase}';

  /// Get the value for the given [argumentValue].
  double getArgumentValueValue(final ArgumentValue argumentValue) {
    final variableId = argumentValue.variableId;
    if (variableId != null) {
      final variable = availableVariables.requireVariable(variableId);
      return getVariableValue(variable);
    }
    return argumentValue.value;
  }

  /// Return the code for this module.
  String getCode({required final ProjectContext projectContext}) {
    final buffer = StringBuffer()
      ..writeln('// $name.')
      ..writeln('module $codeName(');
    for (final variable in variables) {
      buffer
        ..writeln('  // ${variable.name}.')
        ..writeln('  ${variable.codeName} = ${getVariableValue(variable)},');
    }
    buffer
      ..writeln(') {')
      ..writeln('  // [code]');
    for (final shape in shapes) {
      buffer.writeln('  // ${shape.getName()}.');
      final json = shape.arguments;
      switch (shape.type) {
        case ShapeType.circle:
          final arguments = CircleArguments.fromJson(json);
          buffer.write(
            arguments.getCode(projectContext: projectContext, module: this),
          );
        case ShapeType.square:
          final arguments = SquareArguments.fromJson(json);
        case ShapeType.cube:
          final arguments = CubeArguments.fromJson(json);
        case ShapeType.cylinder:
          final arguments = CylinderArguments.fromJson(json);
        case ShapeType.sphere:
          final arguments = SphereArguments.fromJson(json);
        case ShapeType.module:
          final arguments = ModuleArguments.fromJson(json);
      }
    }
    buffer.writeln('}');
    return buffer.toString();
  }
}
