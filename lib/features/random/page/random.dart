import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/tags_container.dart';
import 'package:ishibashi/features/random/components/random_roulette_button.dart';
import 'package:ishibashi/features/random/components/random_store__day_time_part.dart';
import 'package:ishibashi/features/random/components/random_store_button.dart';
import 'package:ishibashi/features/random/components/random_store_image_part.dart';
import 'package:ishibashi/features/random/view_model.dart';

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
              child: SelectableText(
                data.storeClass.name ?? '',
                textAlign: TextAlign.center,
                style: Styles.detailStoreName,
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),

            /// 画像部分
            RandomStoreImagePart(
              storePhotoUrl: data.storeClass.photo_url ?? '',
            ),
            const SizedBox(height: 14),

            /// タグ
            TagsContainerPart(formattedTags: data.storeClass.tags ?? []),
            const SizedBox(height: 10),

            /// 営業時間・営業日
            RandomStoreTimePart(
              openTime: data.storeClass.formattedOpenTime,
              closeTime: data.storeClass.formattedCloseTime,
              openTimeSecond: data.storeClass.formattedOpenTimeSecond,
              closeTimeSecond: data.storeClass.formattedCloseTimeSecond,
              remarksTime: data.storeClass.remarksTime,
            ),
            const SizedBox(height: 10),

            /// くわしくみる
            StoreButton(documentId: data.storeClass.id),
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
