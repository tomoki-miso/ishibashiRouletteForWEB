import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';

import 'package:ishibashi/screens/random/components/random_roulette_button.dart';
import 'package:ishibashi/screens/random/components/random_store_button.dart';
import 'package:ishibashi/screens/random/components/random_store_detail_part.dart';
import 'package:ishibashi/screens/random/components/random_store_image_part.dart';
import 'package:ishibashi/screens/random/components/random_store_tags_part.dart';
import 'package:ishibashi/screens/random/view_model.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class RandomPage extends ConsumerWidget {
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(randomViewModelProvider);

    return data.when(
      data: (data) => Scaffold(
        backgroundColor: ColorName.backGroundYellow,
        appBar: const OriginalAppBar(),
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.all(14)),

            /// 名前
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                data.storeClass.storeName ?? '',
                textAlign: TextAlign.center,
                style: Styles.detailStoreName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),

            /// 画像部分
            RandomStoreImagePart(
              storePhotoUrl: data.storeClass.storePhotoUrl ?? '',
            ),
            const SizedBox(height: 10),

            /// タグと紹介
            RandomStoreTagsPart(formattedTags: data.storeClass.tags ?? []),
            RandomStoreDetailPart(
              storeDetail: data.storeClass.storeDetail,
            ),

            /// くわしくみる
            StoreButton(documentId: data.storeClass.documentId),
            const SizedBox(height: 2),

            ///　ルーレットを回す
            const RouletteButton(),
          ],
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: Container.new,
    );
  }
}
