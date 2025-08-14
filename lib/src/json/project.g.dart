// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  fa: (json['fa'] as num?)?.toDouble() ?? 1,
  fs: (json['fs'] as num?)?.toDouble() ?? 0.5,
  fn: (json['fn'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'fa': instance.fa,
  'fs': instance.fs,
  'fn': instance.fn,
};
