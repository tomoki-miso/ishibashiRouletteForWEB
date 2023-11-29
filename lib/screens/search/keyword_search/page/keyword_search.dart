import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/screens/search/keyword_search/view_model.dart';

class KeywordSearchPage extends ConsumerWidget {
  const KeywordSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(keywordSearchViewModelProvider);

    return state.when(
      data: (data) => Scaffold(
        appBar: const OriginalAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 36,
              ),
              child: TextField(
                controller: data.searchWordController,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  hintText: '店名、カテゴリーなどで検索',
                ),
                onChanged: (value) async {
                  await ref
                      .read(keywordSearchViewModelProvider.notifier)
                      .searchKeyword(data.searchWordController.text);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.searchResultStoreList.length,
                itemBuilder: (context, index) {
                  final store = data.searchResultStoreList[index];
                  return StoreList(
                    onTap: () async {
                      await ref
                          .read(keywordSearchViewModelProvider.notifier)
                          .navigateToStorePage(context, store.documentId);
                    },
                    name: store.storeName,
                    imageUrl: store.storePhotoUrl,
                    tags: store.tags,
                    openTime: store.openTime,
                    closeTime: store.closeTime,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
