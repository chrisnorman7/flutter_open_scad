import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cube_arguments.g.dart';

/// Arguments for cubes.
@JsonSerializable()
class CubeArguments {
  /// Create an instance.
  CubeArguments({
    this.x = const ArgumentValue(value: 10),
    this.y = const ArgumentValue(value: 10),
    this.z = const ArgumentValue(value: 10),
    this.centre = false,
  });

  /// Create an instance from a JSON object.
  factory CubeArguments.fromJson(final Map<String, dynamic> json) =>
      _$CubeArgumentsFromJson(json);

  /// The x coordinate.
  ArgumentValue x;

  /// The y coordinate.
  ArgumentValue y;

  /// The z coordinate.
  ArgumentValue z;

  /// Whether this cube should be centred.
  bool centre;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$CubeArgumentsToJson(this);
}
