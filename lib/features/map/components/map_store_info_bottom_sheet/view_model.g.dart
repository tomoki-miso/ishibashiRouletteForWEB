// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapStoreInfoViewModelHash() =>
    r'47ac2c4056327c55c8e12e495756d3bdbee2ab81';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MapStoreInfoViewModel
    extends BuildlessAutoDisposeAsyncNotifier<MapStoreInfoState> {
  late final String documentId;

  FutureOr<MapStoreInfoState> build(
    String documentId,
  );
}

/// See also [MapStoreInfoViewModel].
@ProviderFor(MapStoreInfoViewModel)
const mapStoreInfoViewModelProvider = MapStoreInfoViewModelFamily();

/// See also [MapStoreInfoViewModel].
class MapStoreInfoViewModelFamily
    extends Family<AsyncValue<MapStoreInfoState>> {
  /// See also [MapStoreInfoViewModel].
  const MapStoreInfoViewModelFamily();

  /// See also [MapStoreInfoViewModel].
  MapStoreInfoViewModelProvider call(
    String documentId,
  ) {
    return MapStoreInfoViewModelProvider(
      documentId,
    );
  }

  @visibleForOverriding
  @override
  MapStoreInfoViewModelProvider getProviderOverride(
    covariant MapStoreInfoViewModelProvider provider,
  ) {
    return call(
      provider.documentId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mapStoreInfoViewModelProvider';
}

/// See also [MapStoreInfoViewModel].
class MapStoreInfoViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MapStoreInfoViewModel,
        MapStoreInfoState> {
  /// See also [MapStoreInfoViewModel].
  MapStoreInfoViewModelProvider(
    String documentId,
  ) : this._internal(
          () => MapStoreInfoViewModel()..documentId = documentId,
          from: mapStoreInfoViewModelProvider,
          name: r'mapStoreInfoViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapStoreInfoViewModelHash,
          dependencies: MapStoreInfoViewModelFamily._dependencies,
          allTransitiveDependencies:
              MapStoreInfoViewModelFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  MapStoreInfoViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.documentId,
  }) : super.internal();

  final String documentId;

  @override
  FutureOr<MapStoreInfoState> runNotifierBuild(
    covariant MapStoreInfoViewModel notifier,
  ) {
    return notifier.build(
      documentId,
    );
  }

  @override
  Override overrideWith(MapStoreInfoViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: MapStoreInfoViewModelProvider._internal(
        () => create()..documentId = documentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        documentId: documentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MapStoreInfoViewModel,
      MapStoreInfoState> createElement() {
    return _MapStoreInfoViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapStoreInfoViewModelProvider &&
        other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapStoreInfoViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<MapStoreInfoState> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _MapStoreInfoViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MapStoreInfoViewModel,
        MapStoreInfoState> with MapStoreInfoViewModelRef {
  _MapStoreInfoViewModelProviderElement(super.provider);

  @override
  String get documentId => (origin as MapStoreInfoViewModelProvider).documentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
