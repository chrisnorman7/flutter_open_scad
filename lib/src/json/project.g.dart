// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  modules:
      (json['modules'] as List<dynamic>?)
          ?.map((e) => ProjectModule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  fa: (json['fa'] as num?)?.toDouble() ?? 1,
  fs: (json['fs'] as num?)?.toDouble() ?? 0.5,
  fn: (json['fn'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'modules': instance.modules,
  'fa': instance.fa,
  'fs': instance.fs,
  'fn': instance.fn,
};
