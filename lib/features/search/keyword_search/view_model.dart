import 'package:flutter/material.dart';
import 'package:ishibashi/domain/store/repository.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/search/keyword_search/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class KeywordSearchViewModel extends _$KeywordSearchViewModel {
  StoresRepo get storesRepo => ref.read(storesRepoProvider.notifier);

  @override
  FutureOr<KeywordSearchState> build() async {
    final state = KeywordSearchState(
      searchWordController: TextEditingController(),
      searchedIsBusinessDayStoresByKeyWord: [],
      searchedIsNotBusinessDayStoresByKeyWord: [],
    );
    return state;
  }

  Future<void> searchKeyword(String searchWord) async {
    final List<String> searchWordList = [searchWord];
    final List<StoreClass> searchedStores =
        await storesRepo.searchStoresByKeyWord(searchWordList);
    final List<StoreClass> searchedIsBusinessDayStores =
        await storesRepo.getIsBusinessDayStores(searchedStores);
    final List<StoreClass> searchedIsNotBusinessDayStores =
        await storesRepo.getIsNotBusinessDayStores(searchedStores);

    if (searchWordList.isEmpty || searchWordList.contains('')) {
      final data = state.requireValue;
      state = AsyncData(
        data.copyWith(
          searchedIsBusinessDayStoresByKeyWord: [],
          searchedIsNotBusinessDayStoresByKeyWord: [],
        ),
      );
    } else {
      final data = state.requireValue;
      state = AsyncData(
        data.copyWith(
          searchedIsBusinessDayStoresByKeyWord: searchedIsBusinessDayStores,
          searchedIsNotBusinessDayStoresByKeyWord:
              searchedIsNotBusinessDayStores,
        ),
      );
    }
  }
}
