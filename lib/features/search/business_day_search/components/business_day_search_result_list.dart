import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/features/search/business_day_search/view_model.dart';

class BusinessDaySearchResultList extends ConsumerWidget {
  const BusinessDaySearchResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(businessDaySearchViewModelProvider).requireValue;

    return Expanded(
      child: data.selectedDays.isEmpty && data.searchResultStoreList.isEmpty
          ? const Center(
              child: Text(
                '曜日を選択してください',
                style: TextStyle(fontSize: 16),
              ),
            )
          : data.selectedDays.isNotEmpty && data.searchResultStoreList.isEmpty
              ? const Center(
                  child: Text(
                    '選択された曜日に営業しているお店はありません',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: data.searchResultStoreList.length,
                  itemBuilder: (context, index) {
                    final store = data.searchResultStoreList[index];
                    return StoreList(
                      onTap: () async {
                        await ref
                            .read(businessDaySearchViewModelProvider.notifier)
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
    );
  }
}
