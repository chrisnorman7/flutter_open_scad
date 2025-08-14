import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle_arguments.g.dart';

/// Arguments for circles.
@JsonSerializable()
class CircleArguments {
  /// Create an instance.
  CircleArguments({
    this.size = 10.0,
    this.sizeType = SizeType.radius,
    this.fa = 12,
    this.fs = 0.5,
    this.fn = 0,
  });

  /// Create an instance from a JSON object.
  factory CircleArguments.fromJson(final Map<String, dynamic> json) =>
      _$CircleArgumentsFromJson(json);

  /// The size of the circle.
  double size;

  /// The type of [size].
  SizeType sizeType;

  /// The value of $fa.
  double fa;

  /// The value of $fs.
  double fs;

  /// The value of $fn.
  int fn;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$CircleArgumentsToJson(this);
}
