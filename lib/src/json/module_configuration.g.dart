// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleConfiguration _$ModuleConfigurationFromJson(Map<String, dynamic> json) =>
    ModuleConfiguration(
      fs: (json['fs'] as num).toDouble(),
      fa: (json['fa'] as num).toDouble(),
      fn: (json['fn'] as num).toInt(),
    );

Map<String, dynamic> _$ModuleConfigurationToJson(
  ModuleConfiguration instance,
) => <String, dynamic>{'fs': instance.fs, 'fa': instance.fa, 'fn': instance.fn};
