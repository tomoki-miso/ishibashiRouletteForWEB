// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$couponDisplayViewModelHash() =>
    r'dc77209fd83c6216fb649bea2dd58104f9651777';

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

abstract class _$CouponDisplayViewModel
    extends BuildlessAutoDisposeAsyncNotifier<CouponDisplayState> {
  late final String couponId;

  FutureOr<CouponDisplayState> build(
    String couponId,
  );
}

/// See also [CouponDisplayViewModel].
@ProviderFor(CouponDisplayViewModel)
const couponDisplayViewModelProvider = CouponDisplayViewModelFamily();

/// See also [CouponDisplayViewModel].
class CouponDisplayViewModelFamily
    extends Family<AsyncValue<CouponDisplayState>> {
  /// See also [CouponDisplayViewModel].
  const CouponDisplayViewModelFamily();

  /// See also [CouponDisplayViewModel].
  CouponDisplayViewModelProvider call(
    String couponId,
  ) {
    return CouponDisplayViewModelProvider(
      couponId,
    );
  }

  @visibleForOverriding
  @override
  CouponDisplayViewModelProvider getProviderOverride(
    covariant CouponDisplayViewModelProvider provider,
  ) {
    return call(
      provider.couponId,
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
  String? get name => r'couponDisplayViewModelProvider';
}

/// See also [CouponDisplayViewModel].
class CouponDisplayViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CouponDisplayViewModel,
        CouponDisplayState> {
  /// See also [CouponDisplayViewModel].
  CouponDisplayViewModelProvider(
    String couponId,
  ) : this._internal(
          () => CouponDisplayViewModel()..couponId = couponId,
          from: couponDisplayViewModelProvider,
          name: r'couponDisplayViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$couponDisplayViewModelHash,
          dependencies: CouponDisplayViewModelFamily._dependencies,
          allTransitiveDependencies:
              CouponDisplayViewModelFamily._allTransitiveDependencies,
          couponId: couponId,
        );

  CouponDisplayViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.couponId,
  }) : super.internal();

  final String couponId;

  @override
  FutureOr<CouponDisplayState> runNotifierBuild(
    covariant CouponDisplayViewModel notifier,
  ) {
    return notifier.build(
      couponId,
    );
  }

  @override
  Override overrideWith(CouponDisplayViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: CouponDisplayViewModelProvider._internal(
        () => create()..couponId = couponId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        couponId: couponId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CouponDisplayViewModel,
      CouponDisplayState> createElement() {
    return _CouponDisplayViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CouponDisplayViewModelProvider &&
        other.couponId == couponId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, couponId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CouponDisplayViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<CouponDisplayState> {
  /// The parameter `couponId` of this provider.
  String get couponId;
}

class _CouponDisplayViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CouponDisplayViewModel,
        CouponDisplayState> with CouponDisplayViewModelRef {
  _CouponDisplayViewModelProviderElement(super.provider);

  @override
  String get couponId => (origin as CouponDisplayViewModelProvider).couponId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
