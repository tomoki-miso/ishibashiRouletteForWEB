import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_buttons/store_detail_insta_jump_button.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_buttons/store_detail_insta_posts_jump_button.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_buttons/store_detail_site_jump_button.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_buttons/store_detail_tabelog_jump_button.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_buttons/store_detail_twitter_jump_button.dart';

class StoreDetailJumpPart extends ConsumerWidget {
  const StoreDetailJumpPart({
    required this.storeWeb,
    required this.storeTabelog,
    required this.storeTwitter,
    required this.storeInsta,
    required this.storeInstaPosts,
    super.key,
  });

  final String storeWeb;
  final String storeTabelog;
  final String storeTwitter;
  final String storeInsta;
  final String storeInstaPosts;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          /// ウェブ
          SiteJumpButton(storeWeb: storeWeb),

          /// タベログ
          TabelogJumpButton(storeTabelog: storeTabelog),

          /// Twitter
          TwitterJumpButton(storeTwitter: storeTwitter),

          /// インスタ
          InstaJumpButton(storeInsta: storeInsta),

          /// インスタ投稿
          InstaJumpPostsButton(storeInstaPosts: storeInstaPosts),
        ],
      );
}
