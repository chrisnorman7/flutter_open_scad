// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cube_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CubeArguments _$CubeArgumentsFromJson(Map<String, dynamic> json) =>
    CubeArguments(
      x: json['x'] == null
          ? const ArgumentValue(value: 10)
          : ArgumentValue.fromJson(json['x'] as Map<String, dynamic>),
      y: json['y'] == null
          ? const ArgumentValue(value: 10)
          : ArgumentValue.fromJson(json['y'] as Map<String, dynamic>),
      z: json['z'] == null
          ? const ArgumentValue(value: 10)
          : ArgumentValue.fromJson(json['z'] as Map<String, dynamic>),
      centre: json['centre'] as bool? ?? false,
    );

Map<String, dynamic> _$CubeArgumentsToJson(CubeArguments instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'centre': instance.centre,
    };
