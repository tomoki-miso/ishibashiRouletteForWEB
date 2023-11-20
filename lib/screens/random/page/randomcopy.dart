import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/providers/storeInfo.dart';
import 'package:ishibashi/screens/random/components/random_store_image_part.dart';
import 'package:ishibashi/screens/random/components/random_store_tags_part.dart';
import 'package:ishibashi/screens/random/components/random_store_text_part.dart';
import 'package:ishibashi/screens/random/components/roulette_button.dart';
import 'package:ishibashi/screens/random/components/store_button.dart';
import 'package:ishibashi/screens/store_details/page/store_rondom_detail.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class RandomCopyPage extends ConsumerWidget {
  RandomCopyPage({super.key});

  // 文字列を要素とするリスト
  final List<String> formattedTags = ['a', 'b', 'c'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(storeInfoNotifierProvider);

    return data.when(
      data: (data) => Scaffold(
        backgroundColor: ColorName.primarySecondary,
        appBar: const OriginalAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(8)),

              //名前
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

              //画像部分
              RandomStoreImagePart(
                storePhotoUrl: data.StorePhotoUrl,
              ),
              const SizedBox(height: 10),

              //タグと紹介
              RandomStoreTagsPart(formattedTags: formattedTags),
              RandomStoreTextPart(
                storeDetail: data.StoreDetail,
              ),

              const StoreButton(),

              const RouletteButton(),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: Container.new,
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
