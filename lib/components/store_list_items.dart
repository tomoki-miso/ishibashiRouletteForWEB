import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';

class StoreListItems extends ConsumerWidget {
  const StoreListItems({
    required this.storeIsBusinessDayStores,
    required this.storeIsNotBusinessDayStores,
    super.key,
  });

  final List<StoreClass> storeIsBusinessDayStores;
  final List<StoreClass> storeIsNotBusinessDayStores;

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListView(
        children: [
          /// 営業日のお店のリスト
          for (final state in storeIsBusinessDayStores)
            StoreList(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoreDetailPage(storeId: state.id),
                  ),
                );
              },
              name: state.name,
              imageUrl: state.photo_url,
              tags: state.tags,
              openTime: state.formattedOpenTime,
              closeTime: state.formattedCloseTime,
              openTimeSecond: state.formattedOpenTimeSecond,
              closeTimeSecond: state.formattedCloseTimeSecond,
              remarksTime: state.remarksTime,
              isBusinessDay: true,
            ),

          /// 営業日でないお店のリスト
          for (final state in storeIsNotBusinessDayStores)
            StoreList(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoreDetailPage(storeId: state.id),
                  ),
                );
              },
              name: state.name,
              imageUrl: state.photo_url,
              tags: state.tags,
              openTime: state.formattedOpenTime,
              closeTime: state.formattedCloseTime,
              openTimeSecond: state.formattedOpenTimeSecond,
              closeTimeSecond: state.formattedCloseTimeSecond,
              remarksTime: state.remarksTime,
              isBusinessDay: false,
            ),
        ],
      );
}
