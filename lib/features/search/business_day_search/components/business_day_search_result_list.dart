import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/store_list_items.dart';
import 'package:ishibashi/features/search/business_day_search/view_model.dart';

class BusinessDaySearchResultList extends ConsumerWidget {
  const BusinessDaySearchResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(businessDaySearchViewModelProvider).requireValue;

    return Expanded(
      child: data.selectedDays.isEmpty &&
              data.searchResultIsBusinessDayStores.isEmpty
          ? const Center(
              child: Text(
                '曜日を選択してください',
                style: TextStyle(fontSize: 16),
              ),
            )
          : data.selectedDays.isNotEmpty &&
                  data.searchResultIsBusinessDayStores.isEmpty
              ? const Center(
                  child: Text(
                    '選択された曜日に営業しているお店はありません',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : StoreListItems(
                  storeIsBusinessDayStores:
                      data.searchResultIsBusinessDayStores,
                  storeIsNotBusinessDayStores:
                      data.searchResultIsNotBusinessDayStores,
                ),
    );
  }
}
