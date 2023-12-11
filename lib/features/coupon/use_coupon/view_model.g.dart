// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$useCouponViewModelHash() =>
    r'543baa8a04c01b6f4f0bfbc6229e6a1b23dde9a7';

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

abstract class _$UseCouponViewModel
    extends BuildlessAutoDisposeAsyncNotifier<UseCouponState> {
  late final String couponId;

  FutureOr<UseCouponState> build(
    String couponId,
  );
}

/// See also [UseCouponViewModel].
@ProviderFor(UseCouponViewModel)
const useCouponViewModelProvider = UseCouponViewModelFamily();

/// See also [UseCouponViewModel].
class UseCouponViewModelFamily extends Family<AsyncValue<UseCouponState>> {
  /// See also [UseCouponViewModel].
  const UseCouponViewModelFamily();

  /// See also [UseCouponViewModel].
  UseCouponViewModelProvider call(
    String couponId,
  ) {
    return UseCouponViewModelProvider(
      couponId,
    );
  }

  @visibleForOverriding
  @override
  UseCouponViewModelProvider getProviderOverride(
    covariant UseCouponViewModelProvider provider,
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
  String? get name => r'useCouponViewModelProvider';
}

/// See also [UseCouponViewModel].
class UseCouponViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UseCouponViewModel, UseCouponState> {
  /// See also [UseCouponViewModel].
  UseCouponViewModelProvider(
    String couponId,
  ) : this._internal(
          () => UseCouponViewModel()..couponId = couponId,
          from: useCouponViewModelProvider,
          name: r'useCouponViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$useCouponViewModelHash,
          dependencies: UseCouponViewModelFamily._dependencies,
          allTransitiveDependencies:
              UseCouponViewModelFamily._allTransitiveDependencies,
          couponId: couponId,
        );

  UseCouponViewModelProvider._internal(
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
  FutureOr<UseCouponState> runNotifierBuild(
    covariant UseCouponViewModel notifier,
  ) {
    return notifier.build(
      couponId,
    );
  }

  @override
  Override overrideWith(UseCouponViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: UseCouponViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<UseCouponViewModel, UseCouponState>
      createElement() {
    return _UseCouponViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UseCouponViewModelProvider && other.couponId == couponId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, couponId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UseCouponViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<UseCouponState> {
  /// The parameter `couponId` of this provider.
  String get couponId;
}

class _UseCouponViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UseCouponViewModel,
        UseCouponState> with UseCouponViewModelRef {
  _UseCouponViewModelProviderElement(super.provider);

  @override
  String get couponId => (origin as UseCouponViewModelProvider).couponId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
