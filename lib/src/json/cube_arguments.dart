import 'package:json_annotation/json_annotation.dart';

part 'cube_arguments.g.dart';

/// Arguments for cubes.
@JsonSerializable()
class CubeArguments {
  /// Create an instance.
  CubeArguments({
    this.x = 10.0,
    this.y = 10.0,
    this.z = 10.0,
    this.centre = false,
  });

  /// Create an instance from a JSON object.
  factory CubeArguments.fromJson(final Map<String, dynamic> json) =>
      _$CubeArgumentsFromJson(json);

  /// The x coordinate.
  double x;

  /// The y coordinate.
  double y;

  /// The z coordinate.
  double z;

  /// Whether this cube should be centred.
  final bool centre;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$CubeArgumentsToJson(this);
}
