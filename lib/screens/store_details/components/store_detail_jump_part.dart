import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_insta_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_site_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_tabelog_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_twitter_jump_button%20copy.dart';

class StoreDetailJumpPart extends ConsumerWidget {
  const StoreDetailJumpPart({
    required this.storeWeb,
    required this.storeTabelog,
    required this.storeTwitter,
    required this.storeInsta,
    super.key,
  });

  final String storeWeb;
  final String storeTabelog;
  final String storeTwitter;
  final String storeInsta;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          //ウェブ
          SiteJumpButton(storeWeb: storeWeb),

          // タベログ
          TabelogJumpButton(storeTabelog: storeTabelog),

          // Twitter
          TwitterJumpButton(storeTwitter: storeTwitter),

          // インスタ
          InstaJumpButton(storeInsta: storeInsta),
        ],
      );
}
