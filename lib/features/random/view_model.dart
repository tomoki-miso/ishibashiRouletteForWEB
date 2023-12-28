import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ishibashi/domain/store/repository.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/random/state.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class RandomViewModel extends _$RandomViewModel {
  StoresRepo get storesRepo => ref.read(storesRepoProvider.notifier);

  @override
  FutureOr<RandomState> build() async {
    final storeClass = await _shuffle();
    final state = RandomState(storeClass: storeClass);
    return state;
  }

  /// ルーレットを回す
  Future<void> getStores() async {
    final storeClass = await _shuffle();
    final data = state.requireValue;
    state = AsyncData(data.copyWith(storeClass: storeClass));
  }

  /// シャッフル
  Future<StoreClass> _shuffle() async {
    final storeList = await storesRepo.getStores();

    final storeIds = List.generate(storeList.length, (index) => index + 1);
    storeIds.shuffle();
    storeIds.removeAt(0);
    final storeId = storeIds.first.toString();
    final StoreClass store = await storesRepo.getStoreById(storeId);
    return store;
  }

  /// 詳細ページへ
  Future<void> navigateToStorePage(
    BuildContext context,
    String documentId,
  ) async =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoreDetailPage(storeId: documentId),
        ),
      );
}
