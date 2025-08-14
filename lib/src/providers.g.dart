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

String _$openFilesHash() => r'bd4976c52ff6523f323e85d2039a11d715a6e48b';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
