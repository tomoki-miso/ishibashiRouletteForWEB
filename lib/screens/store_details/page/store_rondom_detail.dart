import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/class/store_class.dart';
import 'package:ishibashi/providers/stateNotifierProvider.dart';
import 'package:ishibashi/providers/storeInfo.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_detail_text_part.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_image_part.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_insta_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_site_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_tabelog_jump_button.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_buttons/store_detail_twitter_jump_button%20copy.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_tags_part.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

final storeProvider = StateNotifierProvider<StoreNotifier, List<StoreClass>>(
  (ref) => StoreNotifier(),
);

class StorePage extends ConsumerWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;

    final storeProvider = ref.watch(storeInfoNotifierProvider);

    final name = storeProvider.when(
      loading: Container.new,
      error: (e, s) => Container(),
      data: (state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          state.StoreName,
          textAlign: TextAlign.center,
          style: Styles.detailStoreName,
        ),
      ),
    );

    final detail = storeProvider.when(
      loading: Container.new,
      error: (e, s) => Container(),
      data: (state) => StoreDetailTextPart(storeDetail: state.StoreDetail),
    );

    final photo = storeProvider.when(
      loading: () => Image.asset('assets/images/iconKari.png'),
      error: (e, s) => Container(),
      data: (state) => StoreDetailImagePart(storePhotoUrl: state.StorePhotoUrl),
    );

    final tags = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー: $e'), // エラーメッセージを表示
      data: (state) => StoreDetailTagsPart(formattedTags: state.Tags),
    );

    final WebButton = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => SiteJumpButton(storeWeb: state.StoreWeb),
    );

    final TabelogButton = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => TabelogJumpButton(storeTabelog: state.StoreTabelog),
    );

    final TwitterButton = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => TwitterJumpButton(storeTwitter: state.StoreTwitter),
    );

    final InstaButton = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => InstaJumpButton(storeInsta: state.StoreInsta),
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
