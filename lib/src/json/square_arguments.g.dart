// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'square_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareArguments _$SquareArgumentsFromJson(Map<String, dynamic> json) =>
    SquareArguments(
      x: json['x'] == null
          ? const ArgumentValue(value: 10.0)
          : ArgumentValue.fromJson(json['x'] as Map<String, dynamic>),
      y: json['y'] == null
          ? const ArgumentValue(value: 10.0)
          : ArgumentValue.fromJson(json['y'] as Map<String, dynamic>),
      centre: json['centre'] as bool? ?? false,
    );

Map<String, dynamic> _$SquareArgumentsToJson(SquareArguments instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'centre': instance.centre,
    };
