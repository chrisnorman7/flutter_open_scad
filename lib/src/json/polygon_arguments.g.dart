// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polygon_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolygonPoint _$PolygonPointFromJson(Map<String, dynamic> json) => PolygonPoint(
  id: json['id'] as String,
  x: (json['x'] as num?)?.toDouble() ?? 0.0,
  y: (json['y'] as num?)?.toDouble() ?? 0.0,
  name: json['name'] as String?,
);

Map<String, dynamic> _$PolygonPointToJson(PolygonPoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
      'name': instance.name,
    };

PolygonPath _$PolygonPathFromJson(Map<String, dynamic> json) => PolygonPath(
  id: json['id'] as String,
  name: json['name'] as String,
  pointIndexes: (json['pointIndexes'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$PolygonPathToJson(PolygonPath instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pointIndexes': instance.pointIndexes,
    };

PolygonArguments _$PolygonArgumentsFromJson(Map<String, dynamic> json) =>
    PolygonArguments(
      points: (json['points'] as List<dynamic>)
          .map((e) => PolygonPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      paths: (json['paths'] as List<dynamic>)
          .map((e) => PolygonPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      convexity: (json['convexity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$PolygonArgumentsToJson(PolygonArguments instance) =>
    <String, dynamic>{
      'points': instance.points,
      'paths': instance.paths,
      'convexity': instance.convexity,
    };
