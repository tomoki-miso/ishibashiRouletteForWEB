import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/screens/list/view_model.dart';
import 'package:ishibashi/screens/store_details/page/store_list_detail.dart';
import 'package:ishibashi/style/colors.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  Future<void> navigateToStorePage(String documentId) async {
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
          child: StoreList(onTap: () async {
                      await navigateToStorePage(data.storeClassList);
                    }, tags: data.storeClassList, imageUrl: data.storeClassList.),
        
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const Text('loading'),
    );
  }
}
