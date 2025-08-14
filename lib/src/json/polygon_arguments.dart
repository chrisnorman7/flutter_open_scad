import 'package:json_annotation/json_annotation.dart';

part 'polygon_arguments.g.dart';

/// A point in a list of [PolygonArguments].
@JsonSerializable()
class PolygonPoint {
  /// Create an instance.
  PolygonPoint({this.x = 0.0, this.y = 0.0});

  /// Create an instance from a JSON object.
  factory PolygonPoint.fromJson(final Map<String, dynamic> json) =>
      _$PolygonPointFromJson(json);

  /// The x coordinate.
  double x;

  /// The y coordinate.
  double y;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$PolygonPointToJson(this);
}

/// Arguments for polygons.
@JsonSerializable()
class PolygonArguments {
  /// Create an instance.
  PolygonArguments({required this.points, this.paths, this.convexity = 1});

  /// Create an instance from a JSON object.
  factory PolygonArguments.fromJson(final Map<String, dynamic> json) =>
      _$PolygonArgumentsFromJson(json);

  /// The points of the polygon.
  final List<PolygonPoint> points;

  /// The paths to be taken between the points.
  List<List<int>>? paths;

  /// The convexity of the polygon.
  int convexity;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$PolygonArgumentsToJson(this);
}
