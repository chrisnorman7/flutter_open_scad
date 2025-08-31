import 'dart:math';

import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recase/recase.dart';

part 'module_variable.g.dart';

/// The supported operations for variables.
enum VariableOperation {
  /// No operation.
  verbatim,

  /// Addition.
  add,

  /// Subtraction.
  subtract,

  /// Multiplication.
  multiply,

  /// Division.
  divide,

  /// Power.
  power,

  /// Co sign.
  cos,

  /// Sine.
  sin,

  /// Tangent.
  tan,

  /// Arc cosine.
  acos,

  /// Arc sine.
  asin,

  /// Arc tangent.
  atan,
}

/// A variable in a module.
@JsonSerializable()
class ModuleVariable {
  /// Create an instance.
  ModuleVariable({
    required this.id,
    this.name = 'Untitled Variable',
    this.firstVariableId,
    this.firstValue = 1.0,
    this.operation = VariableOperation.verbatim,
    this.secondVariableId,
    this.secondValue = 1.0,
  }) : assert(
         [
           firstVariableId,
           firstValue,
           secondVariableId,
           secondValue,
         ].any((final v) => v != null),
         // ignore: lines_longer_than_80_chars
         'At least one of `firstVariableId`, `firstValue`, `secondVariableId`, or `secondValue` must be set.',
       );

  /// Create an instance from a JSON object.
  factory ModuleVariable.fromJson(final Map<String, dynamic> json) =>
      _$ModuleVariableFromJson(json);

  /// The ID of this variable.
  final String id;

  /// The name of this variable.
  String name;

  /// The ID of the first variable which makes up this variable.
  String? firstVariableId;

  /// The raw first value.
  double firstValue;

  /// The operation which connects the first and second values.
  VariableOperation operation;

  /// The ID of the second variable which makes up this variable.
  String? secondVariableId;

  /// The raw second value.
  double secondValue;

  /// Show the actual value of this variable.
  double getValue(final List<ModuleVariable> variables) {
    final id1 = firstVariableId;
    final id2 = secondVariableId;
    final x = id1 != null
        ? variables.requireVariable(id1).getValue(variables)
        : firstValue;
    if (operation == VariableOperation.verbatim) {
      return x;
    }
    final y = id2 != null
        ? variables.requireVariable(id2).getValue(variables)
        : secondValue;
    switch (operation) {
      case VariableOperation.verbatim:
        // Already handled above.
        return x;
      case VariableOperation.add:
        return x + y;
      case VariableOperation.subtract:
        return x - y;
      case VariableOperation.multiply:
        return x * y;
      case VariableOperation.divide:
        if (y == 0) {
          return 0;
        }
        return x / y;
      case VariableOperation.power:
        return pow(x, y).toDouble();
      case VariableOperation.cos:
        return cos(x);
      case VariableOperation.sin:
        return sin(x);
      case VariableOperation.tan:
        return tan(x);
      case VariableOperation.acos:
        return acos(x);
      case VariableOperation.asin:
        return asin(x);
      case VariableOperation.atan:
        return atan(x);
    }
  }

  /// Return the code-friendly name of this variable.
  String get codeName => 'variable_${id.snakeCase}';

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ModuleVariableToJson(this);
}
