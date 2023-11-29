import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/screens/list/view_model.dart';
import 'package:ishibashi/screens/store_details/page/store_list_detail.dart';
import 'package:ishibashi/style/colors.dart';

class List2Page extends ConsumerWidget {
  const List2Page({super.key});

  Future<void> navigateToStorePage(
      BuildContext context, String documentId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoreListPage(documentId: documentId),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listViewModelProvider);
    return state.when(
      data: (data) => Scaffold(
        backgroundColor: ColorName.backGroundYellow,
        appBar: const OriginalAppBar(),
        body: Center(
          child: ListView.builder(
            itemCount: data.storeClassList.length,
            itemBuilder: (context, index) {
              final store = data.storeClassList[index];
              return StoreList(
                onTap: () async {
                  await navigateToStorePage(context, store.documentId);
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
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
