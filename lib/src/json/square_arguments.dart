import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:json_annotation/json_annotation.dart';

part 'square_arguments.g.dart';

/// Arguments for squares.
@JsonSerializable()
class SquareArguments {
  /// Create an instance.
  SquareArguments({
    this.x = const ArgumentValue(value: 10.0),
    this.y = const ArgumentValue(value: 10.0),
    this.centre = false,
  });

  /// Create an instance from a JSON object.
  factory SquareArguments.fromJson(final Map<String, dynamic> json) =>
      _$SquareArgumentsFromJson(json);

  /// The x size of this square.
  ArgumentValue x;

  /// The y size of the square.
  ArgumentValue y;

  /// Whether the square should be centred about the origin.
  bool centre;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$SquareArgumentsToJson(this);
}
