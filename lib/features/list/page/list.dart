import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/features/list/view_model.dart';
import 'package:ishibashi/style/colors.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

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
              final state = data.storeClassList[index];
              return StoreList(
                onTap: () async {
                  await ref
                      .read(listViewModelProvider.notifier)
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
        ),
      ),
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
