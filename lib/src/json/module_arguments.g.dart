// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleArguments _$ModuleArgumentsFromJson(Map<String, dynamic> json) =>
    ModuleArguments(
      id: json['id'] as String,
      arguments: (json['arguments'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$ModuleArgumentsToJson(ModuleArguments instance) =>
    <String, dynamic>{'id': instance.id, 'arguments': instance.arguments};
