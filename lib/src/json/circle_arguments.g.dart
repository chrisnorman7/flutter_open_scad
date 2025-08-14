// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleArguments _$CircleArgumentsFromJson(Map<String, dynamic> json) =>
    CircleArguments(
      size: (json['size'] as num?)?.toDouble() ?? 10.0,
      sizeType:
          $enumDecodeNullable(_$SizeTypeEnumMap, json['sizeType']) ??
          SizeType.radius,
      fa: (json['fa'] as num?)?.toDouble() ?? 12,
      fs: (json['fs'] as num?)?.toDouble() ?? 0.5,
      fn: (json['fn'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CircleArgumentsToJson(CircleArguments instance) =>
    <String, dynamic>{
      'size': instance.size,
      'sizeType': _$SizeTypeEnumMap[instance.sizeType]!,
      'fa': instance.fa,
      'fs': instance.fs,
      'fn': instance.fn,
    };

const _$SizeTypeEnumMap = {
  SizeType.radius: 'radius',
  SizeType.diameter: 'diameter',
};
