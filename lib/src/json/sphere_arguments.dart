import 'package:flutter_open_scad/src/json/_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sphere_arguments.g.dart';

/// Arguments for a sphere.
@JsonSerializable()
class SphereArguments {
  /// Create an instance.
  SphereArguments({
    this.size = const ArgumentValue(),
    this.sizeType = SizeType.radius,
    this.fn = 0,
    this.fa = 12,
    this.fs = 2,
  });

  /// Create an instance from a JSON object.
  factory SphereArguments.fromJson(final Map<String, dynamic> json) =>
      _$SphereArgumentsFromJson(json);

  /// The size of this sphere.
  ArgumentValue size;

  /// The type of [size].
  SizeType sizeType;

  /// The value of $fa.
  double fa;

  /// The value of $fs.
  double fs;

  /// The value of $fn.
  int fn;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$SphereArgumentsToJson(this);
}
