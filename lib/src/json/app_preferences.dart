import 'dart:convert';
import 'dart:io';

import 'package:flutter_open_scad/flutter_open_scad.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_preferences.g.dart';

/// The preferences for the app.
@JsonSerializable()
class AppPreferences {
  /// Create an instance.
  AppPreferences() : openFiles = [];

  /// Create an instance from a JSON object.
  factory AppPreferences.fromJson(final Map<String, dynamic> json) =>
      _$AppPreferencesFromJson(json);

  /// The list of open file paths.
  final List<String> openFiles;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$AppPreferencesToJson(this);

  /// Save preferences.
  Future<void> save() async {
    openFiles.removeWhere((final filename) => !File(filename).existsSync());
    final preferences = SharedPreferencesAsync();
    await preferences.setString(appPreferencesKey, jsonEncode(toJson()));
  }
}
