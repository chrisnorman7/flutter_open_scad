import 'package:json_annotation/json_annotation.dart';

part 'module_arguments.g.dart';

/// Arguments for a module.
@JsonSerializable()
class ModuleArguments {
  /// Create an instance.
  const ModuleArguments({required this.id});

  /// Create an instance from a JSON object.
  factory ModuleArguments.fromJson(final Map<String, dynamic> json) =>
      _$ModuleArgumentsFromJson(json);

  /// The ID of the model.
  final String id;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ModuleArgumentsToJson(this);
}
