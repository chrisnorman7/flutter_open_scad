import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cylinder_arguments.g.dart';

/// The connection between ends of a cylinder.
enum CylinderEnds {
  /// The ends are linked.
  linked,

  /// The ends are separate (creating a frustum).
  separate,
}

/// The arguments for a cylinder.
@JsonSerializable()
class CylinderArguments {
  /// Create an instance.
  CylinderArguments({
    this.height = 1,
    this.ends = CylinderEnds.linked,
    this.centre = false,
    this.size1 = 1,
    this.size1Type = SizeType.radius,
    this.size2 = 1,
    this.size2Type = SizeType.radius,
    this.fa = 12,
    this.fs = 2,
    this.fn = 0,
  });

  /// Create an instance from a JSON object.
  factory CylinderArguments.fromJson(final Map<String, dynamic> json) =>
      _$CylinderArgumentsFromJson(json);

  /// The height of the cylinder.
  double height;

  /// How the ends are connected.
  CylinderEnds ends;

  /// Whether the cylinder should be centred.
  bool centre;

  /// The size of the bottom circular face.
  double size1;

  /// The type of [size1].
  SizeType size1Type;

  /// The size of the top circular face.
  double size2;

  /// The type of [size2].
  SizeType size2Type;

  /// The value of $fa.
  double fa;

  /// The value of $fs.
  double fs;

  /// The value of $fn.
  int fn;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$CylinderArgumentsToJson(this);
}
