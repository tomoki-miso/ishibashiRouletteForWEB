import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/features/list/view_model.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:ishibashi/style/colors.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listViewModelProvider);
    return state.when(
      data: (data) {
        final listItems = [
          /// 営業日のお店のリスト
          for (final state in data.storeIsBusinessDayList)
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
          for (final state in data.storeIsNotBusinessDayClassList)
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
        ];

        return Scaffold(
          backgroundColor: ColorName.backGroundYellow,
          appBar: const OriginalAppBar(),
          body: Center(
            child: ListView.builder(
              itemBuilder: (_, i) => listItems[i],
              itemCount: listItems.length,
            ),
          ),
        );
      },
      error: (error, stackTrace) => ElevatedButton(
        onPressed: () {
          print(error);
        },
        child: Text(error.toString()),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
