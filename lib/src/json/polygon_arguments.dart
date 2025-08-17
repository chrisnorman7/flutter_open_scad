import 'package:json_annotation/json_annotation.dart';

part 'polygon_arguments.g.dart';

/// A point in a list of [PolygonArguments].
@JsonSerializable()
class PolygonPoint {
  /// Create an instance.
  PolygonPoint({required this.id, this.x = 0.0, this.y = 0.0, this.name});

  /// Create an instance from a JSON object.
  factory PolygonPoint.fromJson(final Map<String, dynamic> json) =>
      _$PolygonPointFromJson(json);

  /// The ID of this point.
  final String id;

  /// The x coordinate.
  double x;

  /// The y coordinate.
  double y;

  /// The name of this point.
  String? name;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$PolygonPointToJson(this);
}

/// A path in a polygon.
@JsonSerializable()
class PolygonPath {
  /// Create an instance.
  PolygonPath({
    required this.id,
    required this.name,
    required this.pointIndexes,
  });

  /// Create an instance from a JSON object.
  factory PolygonPath.fromJson(final Map<String, dynamic> json) =>
      _$PolygonPathFromJson(json);

  /// The ID of this path.
  final String id;

  /// The name of this path.
  String name;

  /// The indexes of the [PolygonPoint]s in this path.
  final List<int> pointIndexes;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$PolygonPathToJson(this);
}

/// Arguments for polygons.
@JsonSerializable()
class PolygonArguments {
  /// Create an instance.
  PolygonArguments({
    required this.points,
    required this.paths,
    this.convexity = 1,
  });

  /// Create an instance from a JSON object.
  factory PolygonArguments.fromJson(final Map<String, dynamic> json) =>
      _$PolygonArgumentsFromJson(json);

  /// The points of the polygon.
  final List<PolygonPoint> points;

  /// The paths to be taken between the points.
  final List<PolygonPath> paths;

  /// The convexity of the polygon.
  int convexity;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$PolygonArgumentsToJson(this);
}
