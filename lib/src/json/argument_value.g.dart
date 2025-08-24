// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'argument_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArgumentValue _$ArgumentValueFromJson(Map<String, dynamic> json) =>
    ArgumentValue(
      variableId: json['variableId'] as String?,
      value: (json['value'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$ArgumentValueToJson(ArgumentValue instance) =>
    <String, dynamic>{
      'variableId': instance.variableId,
      'value': instance.value,
    };
