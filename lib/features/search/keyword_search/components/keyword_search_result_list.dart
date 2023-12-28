import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/features/search/keyword_search/view_model.dart';

class KeywordSearchResultList extends ConsumerWidget {
  const KeywordSearchResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(keywordSearchViewModelProvider).requireValue;

    return Expanded(
      child: ListView.builder(
        itemCount: data.searchResultStoreList.length,
        itemBuilder: (context, index) {
          final state = data.searchResultStoreList[index];
          return StoreList(
            onTap: () async {
              await ref
                  .read(keywordSearchViewModelProvider.notifier)
                  .navigateToStorePage(context, state.id);
            },
            name: state.name,
            imageUrl: state.photo_url,
            tags: state.tags,
            openTime: state.formattedOpenTime,
            closeTime: state.formattedCloseTime,
            openTimeSecond: state.formattedOpenTimeSecond,
            closeTimeSecond: state.formattedCloseTimeSecond,
            remarksTime: state.remarksTime,
          );
        },
      ),
    );
  }
}
