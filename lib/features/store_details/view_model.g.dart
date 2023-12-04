// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listDetailViewModelHash() =>
    r'4a2e37d16ad31333a03f1b933f56de3f3f6f464e';

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

abstract class _$ListDetailViewModel
    extends BuildlessAutoDisposeAsyncNotifier<ListDetailState> {
  late final documentId;

  FutureOr<ListDetailState> build(
    documentId,
  );
}

/// See also [ListDetailViewModel].
@ProviderFor(ListDetailViewModel)
const listDetailViewModelProvider = ListDetailViewModelFamily();

/// See also [ListDetailViewModel].
class ListDetailViewModelFamily extends Family<AsyncValue<ListDetailState>> {
  /// See also [ListDetailViewModel].
  const ListDetailViewModelFamily();

  /// See also [ListDetailViewModel].
  ListDetailViewModelProvider call(
    documentId,
  ) {
    return ListDetailViewModelProvider(
      documentId,
    );
  }

  @visibleForOverriding
  @override
  ListDetailViewModelProvider getProviderOverride(
    covariant ListDetailViewModelProvider provider,
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
  String? get name => r'listDetailViewModelProvider';
}

/// See also [ListDetailViewModel].
class ListDetailViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ListDetailViewModel, ListDetailState> {
  /// See also [ListDetailViewModel].
  ListDetailViewModelProvider(
    documentId,
  ) : this._internal(
          () => ListDetailViewModel()..documentId = documentId,
          from: listDetailViewModelProvider,
          name: r'listDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listDetailViewModelHash,
          dependencies: ListDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              ListDetailViewModelFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  ListDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.documentId,
  }) : super.internal();

  final documentId;

  @override
  FutureOr<ListDetailState> runNotifierBuild(
    covariant ListDetailViewModel notifier,
  ) {
    return notifier.build(
      documentId,
    );
  }

  @override
  Override overrideWith(ListDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListDetailViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ListDetailViewModel, ListDetailState>
      createElement() {
    return _ListDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListDetailViewModelProvider &&
        other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListDetailViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<ListDetailState> {
  /// The parameter `documentId` of this provider.
  get documentId;
}

class _ListDetailViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListDetailViewModel,
        ListDetailState> with ListDetailViewModelRef {
  _ListDetailViewModelProviderElement(super.provider);

  @override
  get documentId => (origin as ListDetailViewModelProvider).documentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
