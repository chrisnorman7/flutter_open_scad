import 'package:json_annotation/json_annotation.dart';

part 'shape.g.dart';

/// The possible shapes.
enum ShapeType {
  /// A 2d circle.
  circle,

  /// A 2d square.
  square,

  /// A cube.
  cube,

  /// A cylinder.
  cylinder,

  /// A sphere.
  sphere,

  /// A polygon.
  polygon,

  /// A polyhedron.
  polyhedron,

  /// Another module in the current project.
  module,
}

/// A shape in a model.
@JsonSerializable()
class Shape {
  /// Create an instance.
  Shape({
    required this.id,
    required this.type,
    this.arguments = const {},
    this.name,
  });

  /// Create an instance from a JSON object.
  factory Shape.fromJson(final Map<String, dynamic> json) =>
      _$ShapeFromJson(json);

  /// The ID of this shape.
  final String id;

  /// The type of this shape.
  final ShapeType type;

  /// The arguments for this shape.
  Map<String, dynamic> arguments;

  /// The name of this shape.
  String? name;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ShapeToJson(this);
}
