import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/providers/storeInfo.dart';
import 'package:ishibashi/screens/random/components/random_roulette_button.dart';
import 'package:ishibashi/screens/random/components/random_store_button.dart';
import 'package:ishibashi/screens/random/components/random_store_detail_part.dart';
import 'package:ishibashi/screens/random/components/random_store_image_part.dart';
import 'package:ishibashi/screens/random/components/random_store_tags_part.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class RandomPage extends ConsumerWidget {
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(storeInfoNotifierProvider);

    return data.when(
      data: (data) => Scaffold(
        backgroundColor: ColorName.backGroundYellow,
        appBar: const OriginalAppBar(),
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.all(4)),

            /// 名前
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.09,
              child: Text(
                data.StoreName,
                textAlign: TextAlign.center,
                style: Styles.detailStoreName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),

            /// 画像部分
            RandomStoreImagePart(
              storePhotoUrl: data.StorePhotoUrl,
            ),
            const SizedBox(height: 10),

            /// タグと紹介
            RandomStoreTagsPart(formattedTags: data.Tags),
            RandomStoreDetailPart(
              storeDetail: data.StoreDetail,
            ),

            /// くわしくみる
            const StoreButton(),

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
