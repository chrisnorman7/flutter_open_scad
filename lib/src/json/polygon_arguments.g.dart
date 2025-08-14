// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polygon_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolygonPoint _$PolygonPointFromJson(Map<String, dynamic> json) => PolygonPoint(
  x: (json['x'] as num?)?.toDouble() ?? 0.0,
  y: (json['y'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PolygonPointToJson(PolygonPoint instance) =>
    <String, dynamic>{'x': instance.x, 'y': instance.y};

PolygonArguments _$PolygonArgumentsFromJson(Map<String, dynamic> json) =>
    PolygonArguments(
      points: (json['points'] as List<dynamic>)
          .map((e) => PolygonPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      paths: (json['paths'] as List<dynamic>?)
          ?.map(
            (e) => (e as List<dynamic>).map((e) => (e as num).toInt()).toList(),
          )
          .toList(),
      convexity: (json['convexity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$PolygonArgumentsToJson(PolygonArguments instance) =>
    <String, dynamic>{
      'points': instance.points,
      'paths': instance.paths,
      'convexity': instance.convexity,
    };
