import 'package:flutter/material.dart';
import 'package:ishibashi/domain/store/repository.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/search/business_day_search/state.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class BusinessDaySearchViewModel extends _$BusinessDaySearchViewModel {
  StoresRepo get storesRepo => ref.read(storesRepoProvider.notifier);

  @override
  FutureOr<BusinessDaySearchState> build() async {
    const state = BusinessDaySearchState(
      searchResultStoreList: [],
      selectedDays: [],
    );
    return state;
  }

  Future<void> searchBusinessDay(List<String> selectedDays) async {
    if (selectedDays.isNotEmpty) {
      final List<StoreClass> storeList =
          await storesRepo.searchStoresByDays(selectedDays);

      final data = state.requireValue;
      state = AsyncData(data.copyWith(searchResultStoreList: storeList));
    } else {
      final data = state.requireValue;
      state = AsyncData(data.copyWith(searchResultStoreList: []));
    }
  }

  /// 曜日のボタンを押したときの処理
  Future<void> handleDaySelection(String day) async {
    final data = state.requireValue;
    final List<String> updatedDays = List.from(data.selectedDays); // 新しいリストを作成

    if (updatedDays.contains(day)) {
      updatedDays.remove(day); // 要素を削除
    } else {
      updatedDays.add(day); // 要素を追加
    }

    state = AsyncData(data.copyWith(selectedDays: updatedDays));
    await searchBusinessDay(updatedDays);
  }

  /// detailPageに飛ばす
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
