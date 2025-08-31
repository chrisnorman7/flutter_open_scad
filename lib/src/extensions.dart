import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Useful methods on [AsyncValue].
extension AsyncValueX<T> on AsyncValue<T> {
  /// A simple version of [when].
  Widget simpleWhen(final Widget Function(T value) data) => when(
    data: data,
    error: ErrorListView.withPositional,
    loading: LoadingWidget.new,
  );
}

/// Useful methods for lists of [ModuleVariable]s.
extension ListModuleVariableX on List<ModuleVariable> {
  /// Find a variable by its [id].
  ModuleVariable? findVariable(final String id) {
    for (final variable in this) {
      if (variable.id == id) {
        return variable;
      }
    }
    return null;
  }

  /// Require a variable with the given [id].
  ModuleVariable requireVariable(final String id) => findVariable(id)!;
}

/// Useful methods for maps of variables.
extension MapStringDynamic on Map<String, dynamic> {
  /// Return this map as code.
  String getCode({final String indent = '', final String lineEnding = ','}) =>
      entries
          .map((final e) => '$indent${e.key} = ${e.value}$lineEnding')
          .join('\n');
}
