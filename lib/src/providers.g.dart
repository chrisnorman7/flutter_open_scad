// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Provide the list of all open files.
@ProviderFor(openFiles)
const openFilesProvider = OpenFilesProvider._();

/// Provide the list of all open files.
final class OpenFilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<OpenFiles>,
          OpenFiles,
          FutureOr<OpenFiles>
        >
    with $FutureModifier<OpenFiles>, $FutureProvider<OpenFiles> {
  /// Provide the list of all open files.
  const OpenFilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openFilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openFilesHash();

  @$internal
  @override
  $FutureProviderElement<OpenFiles> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<OpenFiles> create(Ref ref) {
    return openFiles(ref);
  }
}

String _$openFilesHash() => r'719e004e6907d775234900b0c92a0c15a1869192';

/// Provide a single project.
@ProviderFor(project)
const projectProvider = ProjectFamily._();

/// Provide a single project.
final class ProjectProvider
    extends $FunctionalProvider<ProjectContext, ProjectContext, ProjectContext>
    with $Provider<ProjectContext> {
  /// Provide a single project.
  const ProjectProvider._({
    required ProjectFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'projectProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectHash();

  @override
  String toString() {
    return r'projectProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ProjectContext> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectContext create(Ref ref) {
    final argument = this.argument as String;
    return project(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectContext value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectContext>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectHash() => r'475a3852491e9656418f54d2772ba4bb7de89c31';

/// Provide a single project.
final class ProjectFamily extends $Family
    with $FunctionalFamilyOverride<ProjectContext, String> {
  const ProjectFamily._()
    : super(
        retry: null,
        name: r'projectProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single project.
  ProjectProvider call(String filename) =>
      ProjectProvider._(argument: filename, from: this);

  @override
  String toString() => r'projectProvider';
}

/// Provide a single module.
@ProviderFor(projectModule)
const projectModuleProvider = ProjectModuleFamily._();

/// Provide a single module.
final class ProjectModuleProvider
    extends $FunctionalProvider<ProjectModule, ProjectModule, ProjectModule>
    with $Provider<ProjectModule> {
  /// Provide a single module.
  const ProjectModuleProvider._({
    required ProjectModuleFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'projectModuleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectModuleHash();

  @override
  String toString() {
    return r'projectModuleProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ProjectModule> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectModule create(Ref ref) {
    final argument = this.argument as (String, String);
    return projectModule(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectModule value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectModule>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectModuleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectModuleHash() => r'7fc019fa473c9c515ad1025b544553131775b4e5';

/// Provide a single module.
final class ProjectModuleFamily extends $Family
    with $FunctionalFamilyOverride<ProjectModule, (String, String)> {
  const ProjectModuleFamily._()
    : super(
        retry: null,
        name: r'projectModuleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single module.
  ProjectModuleProvider call(String projectFilename, String moduleId) =>
      ProjectModuleProvider._(
        argument: (projectFilename, moduleId),
        from: this,
      );

  @override
  String toString() => r'projectModuleProvider';
}

/// Provide all shapes in a given module.
@ProviderFor(moduleShapes)
const moduleShapesProvider = ModuleShapesFamily._();

/// Provide all shapes in a given module.
final class ModuleShapesProvider
    extends $FunctionalProvider<List<Shape>, List<Shape>, List<Shape>>
    with $Provider<List<Shape>> {
  /// Provide all shapes in a given module.
  const ModuleShapesProvider._({
    required ModuleShapesFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'moduleShapesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$moduleShapesHash();

  @override
  String toString() {
    return r'moduleShapesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<Shape>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Shape> create(Ref ref) {
    final argument = this.argument as (String, String);
    return moduleShapes(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Shape> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Shape>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleShapesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$moduleShapesHash() => r'eadc00e22b6e38d47accc71058c639eb145266d9';

/// Provide all shapes in a given module.
final class ModuleShapesFamily extends $Family
    with $FunctionalFamilyOverride<List<Shape>, (String, String)> {
  const ModuleShapesFamily._()
    : super(
        retry: null,
        name: r'moduleShapesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide all shapes in a given module.
  ModuleShapesProvider call(String projectFilename, String moduleId) =>
      ModuleShapesProvider._(argument: (projectFilename, moduleId), from: this);

  @override
  String toString() => r'moduleShapesProvider';
}

/// Provide a single shape.
@ProviderFor(moduleShape)
const moduleShapeProvider = ModuleShapeFamily._();

/// Provide a single shape.
final class ModuleShapeProvider extends $FunctionalProvider<Shape, Shape, Shape>
    with $Provider<Shape> {
  /// Provide a single shape.
  const ModuleShapeProvider._({
    required ModuleShapeFamily super.from,
    required (String, String, String) super.argument,
  }) : super(
         retry: null,
         name: r'moduleShapeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$moduleShapeHash();

  @override
  String toString() {
    return r'moduleShapeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Shape> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Shape create(Ref ref) {
    final argument = this.argument as (String, String, String);
    return moduleShape(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Shape value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Shape>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleShapeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$moduleShapeHash() => r'a0a1825465d10a8d5a880f5fec9d103db31225e7';

/// Provide a single shape.
final class ModuleShapeFamily extends $Family
    with $FunctionalFamilyOverride<Shape, (String, String, String)> {
  const ModuleShapeFamily._()
    : super(
        retry: null,
        name: r'moduleShapeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single shape.
  ModuleShapeProvider call(
    String projectFilename,
    String moduleId,
    String shapeId,
  ) => ModuleShapeProvider._(
    argument: (projectFilename, moduleId, shapeId),
    from: this,
  );

  @override
  String toString() => r'moduleShapeProvider';
}

/// Provide all variables for a given module.
@ProviderFor(moduleVariables)
const moduleVariablesProvider = ModuleVariablesFamily._();

/// Provide all variables for a given module.
final class ModuleVariablesProvider
    extends
        $FunctionalProvider<
          List<ModuleVariable>,
          List<ModuleVariable>,
          List<ModuleVariable>
        >
    with $Provider<List<ModuleVariable>> {
  /// Provide all variables for a given module.
  const ModuleVariablesProvider._({
    required ModuleVariablesFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'moduleVariablesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$moduleVariablesHash();

  @override
  String toString() {
    return r'moduleVariablesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<ModuleVariable>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ModuleVariable> create(Ref ref) {
    final argument = this.argument as (String, String);
    return moduleVariables(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ModuleVariable> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ModuleVariable>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleVariablesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$moduleVariablesHash() => r'39817dbce09eed324fba5406b0545d0150374be7';

/// Provide all variables for a given module.
final class ModuleVariablesFamily extends $Family
    with $FunctionalFamilyOverride<List<ModuleVariable>, (String, String)> {
  const ModuleVariablesFamily._()
    : super(
        retry: null,
        name: r'moduleVariablesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide all variables for a given module.
  ModuleVariablesProvider call(String projectFilename, String moduleId) =>
      ModuleVariablesProvider._(
        argument: (projectFilename, moduleId),
        from: this,
      );

  @override
  String toString() => r'moduleVariablesProvider';
}

/// Provide a single variable.
@ProviderFor(moduleVariable)
const moduleVariableProvider = ModuleVariableFamily._();

/// Provide a single variable.
final class ModuleVariableProvider
    extends $FunctionalProvider<ModuleVariable, ModuleVariable, ModuleVariable>
    with $Provider<ModuleVariable> {
  /// Provide a single variable.
  const ModuleVariableProvider._({
    required ModuleVariableFamily super.from,
    required (String, String, String) super.argument,
  }) : super(
         retry: null,
         name: r'moduleVariableProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$moduleVariableHash();

  @override
  String toString() {
    return r'moduleVariableProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ModuleVariable> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ModuleVariable create(Ref ref) {
    final argument = this.argument as (String, String, String);
    return moduleVariable(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModuleVariable value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModuleVariable>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleVariableProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$moduleVariableHash() => r'073e7dc94a3068ea65324e7b33e0f5d06a2dc358';

/// Provide a single variable.
final class ModuleVariableFamily extends $Family
    with $FunctionalFamilyOverride<ModuleVariable, (String, String, String)> {
  const ModuleVariableFamily._()
    : super(
        retry: null,
        name: r'moduleVariableProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single variable.
  ModuleVariableProvider call(
    String projectFilename,
    String moduleId,
    String variableId,
  ) => ModuleVariableProvider._(
    argument: (projectFilename, moduleId, variableId),
    from: this,
  );

  @override
  String toString() => r'moduleVariableProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
