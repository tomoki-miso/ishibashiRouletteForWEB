// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$couponFirestoreHash() => r'eb35296c53c291078de6495c2e992d235ebe1eea';

/// See also [couponFirestore].
@ProviderFor(couponFirestore)
final couponFirestoreProvider = Provider<CollectionReference<Coupon>>.internal(
  couponFirestore,
  name: r'couponFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$couponFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CouponFirestoreRef = ProviderRef<CollectionReference<Coupon>>;
String _$couponRepoHash() => r'f144921b8025aafc481bf6f9d010c008aec12b04';

/// See also [CouponRepo].
@ProviderFor(CouponRepo)
final couponRepoProvider = NotifierProvider<CouponRepo, void>.internal(
  CouponRepo.new,
  name: r'couponRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$couponRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CouponRepo = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
