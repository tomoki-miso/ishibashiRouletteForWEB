import 'package:flutter/material.dart';
import 'package:ishibashi/domain/user_info/domain_user_info.dart';
import 'package:ishibashi/repositories/user_info/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
Stream<UserInfoClass> currentUser(CurrentUserRef ref) async* {
  final UserInfoRepo appUserRepo = ref.read(userInfoRepoProvider.notifier);
  final streamUser = appUserRepo.streamUser();

  /// キャンセル処理
  ref.onDispose(() {
    debugPrint('userAuthInfo キャンセル');
    streamUser.listen((event) {}).cancel();
  });

  await for (final userDoc in streamUser) {
    final UserInfoClass user = userDoc.data()! as UserInfoClass;
    if (user != null) {
      yield user;
    }
  }
}
