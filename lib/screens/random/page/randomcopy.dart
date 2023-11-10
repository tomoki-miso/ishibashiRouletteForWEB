import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/providers/storeInfo.dart';
import 'package:ishibashi/providers/stateNotifierProvider.dart';
import 'package:ishibashi/class/store_class.dart';
import 'package:ishibashi/screens/random/components/random_store_image_part.dart';
import 'package:ishibashi/screens/random/components/random_store_tags_part.dart';
import 'package:ishibashi/screens/random/components/random_store_text_part.dart';
import 'package:ishibashi/screens/random/components/roulette_button.dart';
import 'package:ishibashi/screens/random/components/store_button.dart';
import 'package:ishibashi/screens/store_details/page/store_rondom_detail.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class RandomCopyPage extends StatefulWidget {
  const RandomCopyPage({
    required this.documentId,
    super.key,
  });
  final String documentId;

  @override
  _RandomCopyPageState createState() => _RandomCopyPageState();
}

class _RandomCopyPageState extends State<RandomCopyPage> {
  // 文字列を要素とするリスト
  List<String> formattedTags = ['a', 'b', 'c'];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorName.primarySecondary,
        appBar: OriginalAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(14)),

              //名前
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text("storeName",
                    textAlign: TextAlign.center, style: Styles.detailStoreName),
              ),

              //画像部分
              RandomStoreImagePart(
                  storePhotoUrl:
                      "https://www.ss-ishibashi.jp/wp-content/uploads/2014/03/f260a701c32672bf1b5b2899adf3a9fe-600x450.jpg"),
              const Padding(padding: EdgeInsets.all(3)),

              //タグと紹介
              RandomStoreTagsPart(formattedTags: formattedTags),
              RandomStoreTextPart(storeDetail: "storeDetail"),

              // //ジャンプ部分
              // RandomStoreJumpPart(
              //   storeWeb: storeWeb,
              //   storeTabelog: storeTabelog,
              //   storeTwitter: storeTwitter,
              //   storeInsta: storeInsta,
              // ),
              StoreButton(),
              RouletteButton(
                onPressed: () async {
                  {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StorePage(),
                      ),
                    );
                  }
                  ;
                },
              ),
            ],
          ),
        ),
      );
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
