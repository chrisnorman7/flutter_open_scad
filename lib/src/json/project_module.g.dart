// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModule _$ProjectModuleFromJson(Map<String, dynamic> json) =>
    ProjectModule(
      id: json['id'] as String,
      shapes: (json['shapes'] as List<dynamic>)
          .map((e) => Shape.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String? ?? 'Untitled module',
    );

Map<String, dynamic> _$ProjectModuleToJson(ProjectModule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shapes': instance.shapes,
    };
