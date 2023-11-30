import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/features/store_details/components/store_detail_detail_text_part.dart';
import 'package:ishibashi/features/store_details/components/store_detail_image_part.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_part.dart';
import 'package:ishibashi/features/store_details/components/store_detail_tags_part.dart';
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
              StoreDetailTagsPart(formattedTags: data.storeClass.tags ?? []),
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
