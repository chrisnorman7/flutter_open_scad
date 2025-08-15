// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cube_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CubeArguments _$CubeArgumentsFromJson(Map<String, dynamic> json) =>
    CubeArguments(
      x: (json['x'] as num?)?.toDouble() ?? 10.0,
      y: (json['y'] as num?)?.toDouble() ?? 10.0,
      z: (json['z'] as num?)?.toDouble() ?? 10.0,
      centre: json['centre'] as bool? ?? false,
    );

Map<String, dynamic> _$CubeArgumentsToJson(CubeArguments instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'centre': instance.centre,
    };
