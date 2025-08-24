// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sphere_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SphereArguments _$SphereArgumentsFromJson(Map<String, dynamic> json) =>
    SphereArguments(
      size: json['size'] == null
          ? const ArgumentValue()
          : ArgumentValue.fromJson(json['size'] as Map<String, dynamic>),
      sizeType:
          $enumDecodeNullable(_$SizeTypeEnumMap, json['sizeType']) ??
          SizeType.radius,
      fn: (json['fn'] as num?)?.toInt() ?? 0,
      fa: (json['fa'] as num?)?.toDouble() ?? 12,
      fs: (json['fs'] as num?)?.toDouble() ?? 2,
    );

Map<String, dynamic> _$SphereArgumentsToJson(SphereArguments instance) =>
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
