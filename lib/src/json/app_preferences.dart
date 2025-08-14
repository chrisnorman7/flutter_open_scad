import 'package:json_annotation/json_annotation.dart';

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
}
