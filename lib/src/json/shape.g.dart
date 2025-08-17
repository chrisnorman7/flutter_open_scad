// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) => Shape(
  id: json['id'] as String,
  type: $enumDecode(_$ShapeTypeEnumMap, json['type']),
  arguments: json['arguments'] as Map<String, dynamic>? ?? const {},
  name: json['name'] as String?,
);

Map<String, dynamic> _$ShapeToJson(Shape instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$ShapeTypeEnumMap[instance.type]!,
  'arguments': instance.arguments,
  'name': instance.name,
};

const _$ShapeTypeEnumMap = {
  ShapeType.circle: 'circle',
  ShapeType.square: 'square',
  ShapeType.cube: 'cube',
  ShapeType.cylinder: 'cylinder',
  ShapeType.sphere: 'sphere',
  ShapeType.polygon: 'polygon',
  ShapeType.polyhedron: 'polyhedron',
  ShapeType.module: 'module',
};
