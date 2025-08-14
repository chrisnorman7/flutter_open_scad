import 'package:flutter/material.dart';
import 'package:flutter_open_scad/src/screens/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// The top-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => MaterialApp(
    title: 'Flutter OpenSCAD',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    home: const MainScreen(),
  );
}
