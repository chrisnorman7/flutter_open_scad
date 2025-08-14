// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'square_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareArguments _$SquareArgumentsFromJson(Map<String, dynamic> json) =>
    SquareArguments(
      x: (json['x'] as num?)?.toDouble() ?? 10.0,
      y: (json['y'] as num?)?.toDouble() ?? 10.0,
      centre: json['centre'] as bool? ?? false,
    );

Map<String, dynamic> _$SquareArgumentsToJson(SquareArguments instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'centre': instance.centre,
    };
