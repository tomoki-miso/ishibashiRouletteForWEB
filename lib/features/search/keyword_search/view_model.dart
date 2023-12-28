import 'package:flutter/material.dart';
import 'package:ishibashi/domain/store/repository.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/search/keyword_search/state.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class KeywordSearchViewModel extends _$KeywordSearchViewModel {
  StoresRepo get storesRepo => ref.read(storesRepoProvider.notifier);

  @override
  FutureOr<KeywordSearchState> build() async {
    final state = KeywordSearchState(
      searchWordController: TextEditingController(),
      searchResultStoreList: [],
    );
    return state;
  }

  Future<void> searchKeyword(String searchWord) async {
    final searchWordList = [searchWord];

    final List<StoreClass> storeList =
        await storesRepo.searchStoresByKeyWord(searchWordList);
    final data = state.requireValue;
    state = AsyncData(data.copyWith(searchResultStoreList: storeList));
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
