import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:json_annotation/json_annotation.dart';

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
  ProjectModule({this.name = 'Untitled module', final List<Shape>? shapes})
    : id = newId(),
      shapes = shapes ?? [];

  /// Create an instance from a JSON object.
  factory ProjectModule.fromJson(final Map<String, dynamic> json) =>
      _$ProjectModuleFromJson(json);

  /// The ID of this module.
  final String id;

  /// THe name of this module.
  String name;

  /// The shapes in this module.
  final List<Shape> shapes;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ProjectModuleToJson(this);

  /// Returns `true` if all the shapes in [shapes] are circles or squares.
  ModuleThickness get thickness {
    for (final shape in shapes) {
      if (shape.type != ShapeType.circle && shape.type != ShapeType.square) {
        return ModuleThickness.threeDimensional;
      }
    }
    return ModuleThickness.flat;
  }
}
