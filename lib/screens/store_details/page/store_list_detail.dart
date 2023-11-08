import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_detail_text_part.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_image_part.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_part.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_tags_part.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class StoreListPage extends StatefulWidget {
  const StoreListPage({
    required this.documentId,
    super.key,
  });
  final String documentId;

  @override
  _StoreListPageState createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  List<String> formattedTags = [];
  String storeName = ''; // 仮の初期値
  String storeDetail = ''; // 仮の初期値
  String storePhotoUrl = ''; // 仮の初期値
  String storeWeb = ''; // 仮の初期値
  String storeTabelog = ''; // 仮の初期値
  String storeTwitter = ''; // 仮の初期値
  String storeInsta = ''; // 仮の初期値

  @override
  void initState() {
    super.initState();
    _fetchStoreData(widget.documentId);
  }

  Future<void> _fetchStoreData(String documentId) async {
    final storeSnapshot = await FirebaseFirestore.instance
        .collection('stores')
        .doc(documentId)
        .get();

    if (storeSnapshot.exists) {
      final storeData = storeSnapshot.data();
      if (storeData != null) {
        storeName = storeData['name'] ?? '';
        storeDetail = storeData['detail'] ?? '';
        storeWeb = storeData['web'] ?? '';
        storeTwitter = storeData['twitter'] ?? '';
        storeInsta = storeData['insta'] ?? '';
        storeTabelog = storeData['tabelog'] ?? '';
        storePhotoUrl = storeData['photo_url'] ?? '';

        final tags = await _fetchTags(
          FirebaseFirestore.instance
              .collection('stores')
              .doc(widget.documentId),
        );

        setState(() {
          formattedTags = tags;
        });
      }
    }
  }

  Future<List<String>> _fetchTags(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    // タグ情報を取得
    if (storeData != null && storeData.containsKey('tags')) {
      final tags = storeData['tags'] as List<dynamic>;
      final formattedTags = tags.map((tag) => tag.toString()).toList();

      return formattedTags;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorName.primarySecondary,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
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

              //名前
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(storeName,
                    textAlign: TextAlign.center, style: Styles.detailStoreName),
              ),
              const Padding(padding: EdgeInsets.all(10)),

              //画像部分
              StoreDetailImagePart(storePhotoUrl: storePhotoUrl),
              const Padding(padding: EdgeInsets.all(10)),

              //タグと紹介
              StoreDetailTagsPart(formattedTags: formattedTags),
              StoreDetailTextPart(storeDetail: storeDetail),
              const Padding(padding: EdgeInsets.all(10)),

              //ジャンプ部分
              StoreDetailJumpPart(
                storeWeb: storeWeb,
                storeTabelog: storeTabelog,
                storeTwitter: storeTwitter,
                storeInsta: storeInsta,
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
