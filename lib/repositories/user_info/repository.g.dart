// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserFirestoreHash() => r'797d72ec23d32ad763ef5bfc3a8f58a3a4185fae';

/// See also [appUserFirestore].
@ProviderFor(appUserFirestore)
final appUserFirestoreProvider =
    Provider<CollectionReference<UserInfoClass>>.internal(
  appUserFirestore,
  name: r'appUserFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUserFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUserFirestoreRef = ProviderRef<CollectionReference<UserInfoClass>>;
String _$userInfoRepoHash() => r'46fb0ff9b788cf876bf978ba68eb0193965ec23a';

/// See also [UserInfoRepo].
@ProviderFor(UserInfoRepo)
final userInfoRepoProvider = NotifierProvider<UserInfoRepo, void>.internal(
  UserInfoRepo.new,
  name: r'userInfoRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userInfoRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserInfoRepo = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
