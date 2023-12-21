// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userInfoFirestoreHash() => r'5c2549e13c501ac537c94f8d0e73a0719c2e4d80';

/// See also [userInfoFirestore].
@ProviderFor(userInfoFirestore)
final userInfoFirestoreProvider =
    Provider<CollectionReference<UserInfoClass>>.internal(
  userInfoFirestore,
  name: r'userInfoFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userInfoFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserInfoFirestoreRef = ProviderRef<CollectionReference<UserInfoClass>>;
String _$userInfoClassRepoHash() => r'4fa46cf0159b14b7605ae04e0a8fab6662468995';

/// See also [UserInfoClassRepo].
@ProviderFor(UserInfoClassRepo)
final userInfoClassRepoProvider =
    NotifierProvider<UserInfoClassRepo, void>.internal(
  UserInfoClassRepo.new,
  name: r'userInfoClassRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userInfoClassRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserInfoClassRepo = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
