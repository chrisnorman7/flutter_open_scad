// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleVariable _$ModuleVariableFromJson(Map<String, dynamic> json) =>
    ModuleVariable(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Untitled Variable',
      firstVariableId: json['firstVariableId'] as String?,
      firstValue: (json['firstValue'] as num?)?.toDouble() ?? 1.0,
      operation:
          $enumDecodeNullable(_$VariableOperationEnumMap, json['operation']) ??
          VariableOperation.verbatim,
      secondVariableId: json['secondVariableId'] as String?,
      secondValue: (json['secondValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ModuleVariableToJson(ModuleVariable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firstVariableId': instance.firstVariableId,
      'operation': _$VariableOperationEnumMap[instance.operation]!,
      'firstValue': instance.firstValue,
      'secondVariableId': instance.secondVariableId,
      'secondValue': instance.secondValue,
    };

const _$VariableOperationEnumMap = {
  VariableOperation.verbatim: 'verbatim',
  VariableOperation.add: 'add',
  VariableOperation.subtract: 'subtract',
  VariableOperation.multiply: 'multiply',
  VariableOperation.divide: 'divide',
  VariableOperation.power: 'power',
  VariableOperation.cos: 'cos',
  VariableOperation.sin: 'sin',
  VariableOperation.tan: 'tan',
  VariableOperation.acos: 'acos',
  VariableOperation.asin: 'asin',
  VariableOperation.atan: 'atan',
};
