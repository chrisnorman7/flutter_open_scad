import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
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
