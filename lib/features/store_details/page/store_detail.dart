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
    required this.documentId,
    super.key,
  });

  final String documentId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listDetailViewModelProvider(documentId));
    return data.when(
      data: (data) => Scaffold(
        backgroundColor: ColorName.backGroundYellow,
        appBar: const OriginalAppBar(withIcon: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(14)),

              //名前
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  data.storeClass.storeName ?? '',
                  textAlign: TextAlign.center,
                  style: Styles.detailStoreName,
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),

              //画像部分
              StoreDetailImagePart(
                storePhotoUrl: data.storeClass.storePhotoUrl ?? '',
              ),
              const Padding(padding: EdgeInsets.all(10)),

              //タグと紹介
              TagsContainerPart(formattedTags: data.storeClass.tags ?? []),
              const SizedBox(height: 12),

              StoreDetailStoreDayTimePart(
                openTime: data.storeClass.openTime,
                closeTime: data.storeClass.closeTime,
                openTimeSecond: data.storeClass.openTimeSecond,
                closeTimeSecond: data.storeClass.closeTimeSecond,
                remarksTime: data.storeClass.remarksTime,
                businessDays: data.storeClass.businessDays,
                remarksDay: data.storeClass.remarksDay,
              ),
              StoreDetailTextPart(
                storeDetail: data.storeClass.storeDetail ?? '',
              ),
              const Padding(padding: EdgeInsets.all(10)),

              //ジャンプ部分
              StoreDetailJumpPart(
                storeWeb: data.storeClass.storeWeb ?? '',
                storeTabelog: data.storeClass.storeTabelog ?? '',
                storeTwitter: data.storeClass.storeTwitter ?? '',
                storeInsta: data.storeClass.storeInsta ?? '',
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
