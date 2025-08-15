// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleVariable _$ModuleVariableFromJson(Map<String, dynamic> json) =>
    ModuleVariable(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Untitled Variable',
      defaultValue: (json['defaultValue'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$ModuleVariableToJson(ModuleVariable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'defaultValue': instance.defaultValue,
    };
