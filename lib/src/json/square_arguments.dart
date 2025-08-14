import 'package:json_annotation/json_annotation.dart';

part 'square_arguments.g.dart';

/// Arguments for squares.
@JsonSerializable()
class SquareArguments {
  /// Create an instance.
  SquareArguments({this.x = 10.0, this.y = 10.0, this.centre = false});

  /// Create an instance from a JSON object.
  factory SquareArguments.fromJson(final Map<String, dynamic> json) =>
      _$SquareArgumentsFromJson(json);

  /// The x size of this square.
  double x;

  /// The y size of the square.
  double y;

  /// Whether the square should be centred about the origin.
  bool centre;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$SquareArgumentsToJson(this);
}
