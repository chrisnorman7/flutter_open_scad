import 'package:json_annotation/json_annotation.dart';

part 'module_configuration.g.dart';

/// Default OpenSCAD configuration options.
///
/// This class provides a quick and easy way to manage $fs, $a, and $fn.
@JsonSerializable()
class ModuleConfiguration {
  /// Create an instance.
  const ModuleConfiguration({
    required this.fs,
    required this.fa,
    required this.fn,
  });

  /// Create an instance from a JSON object.
  factory ModuleConfiguration.fromJson(final Map<String, dynamic> json) =>
      _$ModuleConfigurationFromJson(json);

  /// The value of $fs.
  final double fs;

  /// The value of $fa.
  final double fa;

  /// The value of $fn.
  final int fn;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ModuleConfigurationToJson(this);
}
