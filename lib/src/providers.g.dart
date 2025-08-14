// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Provide the app preferences.
@ProviderFor(appPreferences)
const appPreferencesProvider = AppPreferencesProvider._();

/// Provide the app preferences.
final class AppPreferencesProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppPreferences>,
          AppPreferences,
          FutureOr<AppPreferences>
        >
    with $FutureModifier<AppPreferences>, $FutureProvider<AppPreferences> {
  /// Provide the app preferences.
  const AppPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPreferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<AppPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppPreferences> create(Ref ref) {
    return appPreferences(ref);
  }
}

String _$appPreferencesHash() => r'c42faa336721456d37a30352005093d746e16317';

/// Get the recent file paths.
@ProviderFor(recentFiles)
const recentFilesProvider = RecentFilesProvider._();

/// Get the recent file paths.
final class RecentFilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<File>>,
          List<File>,
          FutureOr<List<File>>
        >
    with $FutureModifier<List<File>>, $FutureProvider<List<File>> {
  /// Get the recent file paths.
  const RecentFilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentFilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentFilesHash();

  @$internal
  @override
  $FutureProviderElement<List<File>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<File>> create(Ref ref) {
    return recentFiles(ref);
  }
}

String _$recentFilesHash() => r'3001fa2a734758732db5726b082362d61a26981f';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
