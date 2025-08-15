// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModule _$ProjectModuleFromJson(Map<String, dynamic> json) =>
    ProjectModule(
      name: json['name'] as String? ?? 'Untitled module',
      shapes: (json['shapes'] as List<dynamic>?)
          ?.map((e) => Shape.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectModuleToJson(ProjectModule instance) =>
    <String, dynamic>{'name': instance.name, 'shapes': instance.shapes};
