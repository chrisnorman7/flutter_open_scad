import 'package:json_annotation/json_annotation.dart';

part 'module_arguments.g.dart';

/// Arguments for a module.
@JsonSerializable()
class ModuleArguments {
  /// Create an instance.
  ModuleArguments({required this.id, required this.arguments});

  /// Create an instance from a JSON object.
  factory ModuleArguments.fromJson(final Map<String, dynamic> json) =>
      _$ModuleArgumentsFromJson(json);

  /// The ID of the model.
  String id;

  /// The arguments for the module.
  final Map<String, double> arguments;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ModuleArgumentsToJson(this);
}
