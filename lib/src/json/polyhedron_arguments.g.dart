// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polyhedron_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolyhedronPoint _$PolyhedronPointFromJson(Map<String, dynamic> json) =>
    PolyhedronPoint(
      x: (json['x'] as num?)?.toDouble() ?? 0.0,
      y: (json['y'] as num?)?.toDouble() ?? 0.0,
      z: (json['z'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$PolyhedronPointToJson(PolyhedronPoint instance) =>
    <String, dynamic>{'x': instance.x, 'y': instance.y, 'z': instance.z};

PolyhedronArguments _$PolyhedronArgumentsFromJson(Map<String, dynamic> json) =>
    PolyhedronArguments(
      points: (json['points'] as List<dynamic>)
          .map((e) => PolyhedronPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      faces: (json['faces'] as List<dynamic>?)
          ?.map(
            (e) => (e as List<dynamic>).map((e) => (e as num).toInt()).toList(),
          )
          .toList(),
      convexity: (json['convexity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$PolyhedronArgumentsToJson(
  PolyhedronArguments instance,
) => <String, dynamic>{
  'points': instance.points,
  'faces': instance.faces,
  'convexity': instance.convexity,
};
