import 'package:json_annotation/json_annotation.dart';

part 'argument_value.g.dart';

/// A class representing the value of an argument.
@JsonSerializable()
class ArgumentValue {
  /// Create an instance.
  const ArgumentValue({this.variableId, this.value = 1.0});

  /// Create an instance from a JSON object.
  factory ArgumentValue.fromJson(final Map<String, dynamic> json) =>
      _$ArgumentValueFromJson(json);

  /// The ID of the variable to use for the value of this argument.
  final String? variableId;

  /// The literal value of this argument.
  final double value;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ArgumentValueToJson(this);
}
