import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/random/view_model.dart';

import 'package:ishibashi/screens/store_details/components/store_detail_detail_text_part.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_image_part.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_insta_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_site_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_tabelog_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_twitter_jump_button%20copy.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_tags_part.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class StorePage extends ConsumerWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;

    final data = ref.watch(randomViewModelProvider);

    final name = data.when(
      loading: Container.new,
      error: (e, s) => Container(),
      data: (data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          data.storeName,
          textAlign: TextAlign.center,
          style: Styles.detailStoreName,
        ),
      ),
    );

    final detail = data.when(
      loading: Container.new,
      error: (e, s) => Container(),
      data: (data) => StoreDetailTextPart(storeDetail: data.storeDetail),
    );

    final photo = data.when(
      loading: () => Image.asset('assets/images/iconKari.png'),
      error: (e, s) => Container(),
      data: (data) => StoreDetailImagePart(storePhotoUrl: data.storePhotoUrl),
    );

    final tags = data.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー: $e'), // エラーメッセージを表示
      data: (data) => StoreDetailTagsPart(formattedTags: data.tags),
    );

    final WebButton = data.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (data) => SiteJumpButton(storeWeb: data.storeWeb),
    );

    final TabelogButton = data.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (data) => TabelogJumpButton(storeTabelog: data.storeTabelog),
    );

    final TwitterButton = data.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (data) => TwitterJumpButton(storeTwitter: data.storeTwitter),
    );

    final InstaButton = data.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (data) => InstaJumpButton(storeInsta: data.storeInsta),
    );

    return Scaffold(
      backgroundColor: ColorName.backGroundYellow,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * 0.08),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.greenAccent),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(14)),
            name,
            const Padding(padding: EdgeInsets.all(10)),
            photo,
            const Padding(padding: EdgeInsets.all(10)),
            tags,
            detail,
            const Padding(padding: EdgeInsets.all(10)),
            WebButton,
            TabelogButton,
            TwitterButton,
            InstaButton,
          ],
        ),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) => IconButton(
        icon: _isLiked
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        onPressed: _toggleLike,
      );
}
