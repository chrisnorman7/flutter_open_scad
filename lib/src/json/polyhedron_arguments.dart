import 'package:json_annotation/json_annotation.dart';

part 'polyhedron_arguments.g.dart';

/// A point in a list of [PolyhedronArguments].
@JsonSerializable()
class PolyhedronPoint {
  /// Create an instance.
  PolyhedronPoint({this.x = 0.0, this.y = 0.0, this.z = 0.0});

  /// Create an instance from a JSON object.
  factory PolyhedronPoint.fromJson(final Map<String, dynamic> json) =>
      _$PolyhedronPointFromJson(json);

  /// The x coordinate.
  double x;

  /// The y coordinate.
  double y;

  /// The z coordinate.
  double z;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$PolyhedronPointToJson(this);
}

/// Arguments for polyhedrons.
@JsonSerializable()
class PolyhedronArguments {
  /// Create an instance.
  PolyhedronArguments({required this.points, this.faces, this.convexity = 1});

  /// Create an instance from a JSON object.
  factory PolyhedronArguments.fromJson(final Map<String, dynamic> json) =>
      _$PolyhedronArgumentsFromJson(json);

  /// The points of the polygon.
  final List<PolyhedronPoint> points;

  /// The faces of the polyhedron.
  List<List<int>>? faces;

  /// The convexity of the polygon.
  int convexity;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$PolyhedronArgumentsToJson(this);
}
