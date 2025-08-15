import 'package:json_annotation/json_annotation.dart';

part 'module_variable.g.dart';

/// A variable in a module.
@JsonSerializable()
class ModuleVariable {
  /// Create an instance.
  ModuleVariable({
    required this.id,
    this.name = 'Untitled Variable',
    this.defaultValue = 1.0,
  });

  /// Create an instance from a JSON object.
  factory ModuleVariable.fromJson(final Map<String, dynamic> json) =>
      _$ModuleVariableFromJson(json);

  /// The ID of this variable.
  final String id;

  /// The name of this variable.
  String name;

  /// The default value.
  double defaultValue;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ModuleVariableToJson(this);
}
