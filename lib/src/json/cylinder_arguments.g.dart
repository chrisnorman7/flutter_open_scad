// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cylinder_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CylinderArguments _$CylinderArgumentsFromJson(Map<String, dynamic> json) =>
    CylinderArguments(
      height: json['height'] == null
          ? const ArgumentValue()
          : ArgumentValue.fromJson(json['height'] as Map<String, dynamic>),
      ends:
          $enumDecodeNullable(_$CylinderEndsEnumMap, json['ends']) ??
          CylinderEnds.linked,
      centre: json['centre'] as bool? ?? false,
      size1: json['size1'] == null
          ? const ArgumentValue()
          : ArgumentValue.fromJson(json['size1'] as Map<String, dynamic>),
      size1Type:
          $enumDecodeNullable(_$SizeTypeEnumMap, json['size1Type']) ??
          SizeType.radius,
      size2: json['size2'] == null
          ? const ArgumentValue()
          : ArgumentValue.fromJson(json['size2'] as Map<String, dynamic>),
      size2Type:
          $enumDecodeNullable(_$SizeTypeEnumMap, json['size2Type']) ??
          SizeType.radius,
      fa: (json['fa'] as num?)?.toDouble() ?? 12,
      fs: (json['fs'] as num?)?.toDouble() ?? 2,
      fn: (json['fn'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CylinderArgumentsToJson(CylinderArguments instance) =>
    <String, dynamic>{
      'height': instance.height,
      'ends': _$CylinderEndsEnumMap[instance.ends]!,
      'centre': instance.centre,
      'size1': instance.size1,
      'size1Type': _$SizeTypeEnumMap[instance.size1Type]!,
      'size2': instance.size2,
      'size2Type': _$SizeTypeEnumMap[instance.size2Type]!,
      'fa': instance.fa,
      'fs': instance.fs,
      'fn': instance.fn,
    };

const _$CylinderEndsEnumMap = {
  CylinderEnds.linked: 'linked',
  CylinderEnds.separate: 'separate',
};

const _$SizeTypeEnumMap = {
  SizeType.radius: 'radius',
  SizeType.diameter: 'diameter',
};
