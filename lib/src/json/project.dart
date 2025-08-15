import 'package:flutter_open_scad/src/json/project_module.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// A project.
@JsonSerializable()
class Project {
  /// Create an instance.
  Project({required this.modules, this.fa = 1, this.fs = 0.5, this.fn = 0});

  /// Create an instance from a JSON object.
  factory Project.fromJson(final Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  /// The modules in this project.
  @JsonKey(defaultValue: [])
  final List<ProjectModule> modules;

  /// The value of $fa.
  double fa;

  /// The value of $fs.
  double fs;

  /// The value of $fn.
  int fn;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
