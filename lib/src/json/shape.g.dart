// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) => Shape(
  type: $enumDecode(_$ShapeTypeEnumMap, json['type']),
  arguments: json['arguments'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$ShapeToJson(Shape instance) => <String, dynamic>{
  'type': _$ShapeTypeEnumMap[instance.type]!,
  'arguments': instance.arguments,
};

const _$ShapeTypeEnumMap = {
  ShapeType.circle: 'circle',
  ShapeType.square: 'square',
  ShapeType.cube: 'cube',
  ShapeType.cylinder: 'cylinder',
  ShapeType.sphere: 'sphere',
  ShapeType.polygon: 'polygon',
  ShapeType.polyhedron: 'polyhedron',
};
