import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/store_list_items.dart';
import 'package:ishibashi/features/search/keyword_search/view_model.dart';

class KeywordSearchResultList extends ConsumerWidget {
  const KeywordSearchResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(keywordSearchViewModelProvider).requireValue;
    final String keyWord = data.searchWordController.text;

    return Expanded(
      child: keyWord.isEmpty
          ? const Center(
              child: Text(
                'キーワードを入力してお店を探しましょう！',
                style: TextStyle(fontSize: 16),
              ),
            )
          : data.searchedIsBusinessDayStoresByKeyWord.isNotEmpty &&
                  data.searchedIsNotBusinessDayStoresByKeyWord.isNotEmpty
              ? StoreListItems(
                  storeIsBusinessDayStores:
                      data.searchedIsBusinessDayStoresByKeyWord,
                  storeIsNotBusinessDayStores:
                      data.searchedIsNotBusinessDayStoresByKeyWord,
                )
              : Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      '「$keyWord」に一致するお店は見つかりませんでした.......',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
    );
  }
}
