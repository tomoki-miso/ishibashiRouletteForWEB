import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/tags_container.dart';
import 'package:ishibashi/features/store_details/components/store_detail_day_time_part.dart';
import 'package:ishibashi/features/store_details/components/store_detail_detail_text_part.dart';
import 'package:ishibashi/features/store_details/components/store_detail_image_part.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_part.dart';
import 'package:ishibashi/features/store_details/view_model.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class StoreDetailPage extends ConsumerWidget {
  const StoreDetailPage({
    required this.storeId,
    super.key,
  });

  final String storeId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listDetailViewModelProvider(storeId));
    return data.when(
      data: (data) => Scaffold(
        backgroundColor: ColorName.backGroundYellow,
        appBar: const OriginalAppBar(withIcon: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(14)),

              /// 名前
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  data.storeClass.name ?? '',
                  textAlign: TextAlign.center,
                  style: Styles.detailStoreName,
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),

              /// 画像部分
              StoreDetailImagePart(
                storePhotoUrl: data.storeClass.photo_url ?? '',
              ),
              const Padding(padding: EdgeInsets.all(10)),

              /// タグ
              TagsContainerPart(formattedTags: data.storeClass.tags ?? []),
              const SizedBox(height: 12),

              /// 営業時間、営業日
              StoreDetailStoreDayTimePart(
                openTime: data.storeClass.formattedOpenTime,
                closeTime: data.storeClass.formattedCloseTime,
                openTimeSecond: data.storeClass.formattedOpenTimeSecond,
                closeTimeSecond: data.storeClass.formattedCloseTimeSecond,
                remarksTime: data.storeClass.remarksTime,
                businessDays: data.storeClass.daysOfWeek,
                remarksDay: data.storeClass.remarksDay,
              ),

              /// 紹介文章
              StoreDetailTextPart(
                storeDetail: data.storeClass.detail ?? '',
              ),
              const Padding(padding: EdgeInsets.all(10)),

              //ジャンプ部分
              StoreDetailJumpPart(
                storeWeb: data.storeClass.web ?? '',
                storeTabelog: data.storeClass.tabelog ?? '',
                storeTwitter: data.storeClass.twitter ?? '',
                storeInsta: data.storeClass.insta ?? '',
                storeInstaPosts: data.storeClass.instaPosts ?? '',
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
