import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ishibashi/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'stores.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => StoreDataProvider(),
      child: MyApp(),
    ),
  );
}

class StoreDataProvider with ChangeNotifier {
  String storeName = '';
  String storeDetail = '';
  String storeWeb = '';
  String storeTwitter = '';
  String storeInsta = '';
  String storeTabelog = '';
  String storePhotoUrl = '';
  List<String> formattedTags = [];

  void setStoreName(String name) {
    storeName = name;
    notifyListeners();
  }

  void setStoreDetail(String detail) {
    storeDetail = detail;
    notifyListeners();
  }

  void setStoreWeb(String web) {
    storeWeb = web;
    notifyListeners();
  }

  void setStoreTwitter(String twitter) {
    storeTwitter = twitter;
    notifyListeners();
  }

  void setStoreInsta(String insta) {
    storeInsta = insta;
    notifyListeners();
  }

  void setStoreTabelog(String tabelog) {
    storeTabelog = tabelog;
    notifyListeners();
  }

  void setStorePhotoUrl(String photoUrl) {
    storePhotoUrl = photoUrl;
    notifyListeners();
  }

  void setFormattedTags(List<String> tags) {
    formattedTags = tags.map((tag) => '#$tag').toList();
    notifyListeners();
  }
}

class RandomPage extends StatefulWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  String storeName = '';
  String storeDetail = '';
  String storeWeb = '';
  String storeTwitter = '';
  String storeInsta = '';
  String storeTabelog = '';
  String storePhotoUrl = '';

  get formattedTags => null;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    print("Fetching data...");

    final storeSnapshot =
        await FirebaseFirestore.instance.collection('stores').get();
    final storeIds =
        List.generate(storeSnapshot.docs.length, (index) => index + 1);
    storeIds.shuffle();
    storeIds.removeAt(0);
    final storeId = storeIds.first;

    final storeData = storeSnapshot.docs[storeId - 1].data();
    final storeNameData = storeData?['name'] ?? '';
    final storeDetailData = storeData?['detail'] ?? '';
    final storeWebData = storeData?['web'] ?? '';
    final storeTwitterData = storeData?['twitter'] ?? '';
    final storeInstaData = storeData?['insta'] ?? '';
    final storeTabelogData = storeData?['tabelog'] ?? '';
    final storePhotoUrlData = storeData?['photoUrl'] ?? '';

    print("Fetched storeNameData: $storeNameData");

    Provider.of<StoreDataProvider>(context, listen: false)
        .setStoreName(storeNameData);
    Provider.of<StoreDataProvider>(context, listen: false)
        .setStoreDetail(storeDetailData);
    Provider.of<StoreDataProvider>(context, listen: false)
        .setStoreWeb(storeWebData);
    Provider.of<StoreDataProvider>(context, listen: false)
        .setStoreTwitter(storeTwitterData);
    Provider.of<StoreDataProvider>(context, listen: false)
        .setStoreInsta(storeInstaData);
    Provider.of<StoreDataProvider>(context, listen: false)
        .setStoreTabelog(storeTabelogData);
    Provider.of<StoreDataProvider>(context, listen: false)
        .setStorePhotoUrl(storePhotoUrlData);

    setState(() {
      storeName = storeNameData;
      storeDetail = storeDetailData;
      storeWeb = storeWebData;
      storeTwitter = storeTwitterData;
      storeInsta = storeInstaData;
      storeTabelog = storeTabelogData;
      storePhotoUrl = storePhotoUrlData;
    });
  }

  Future<List<String>> _fetchTags(DocumentReference storeReference) async {
    final QuerySnapshot querySnapshot =
        await storeReference.collection('tags').get();

    // タグのリストを初期化
    final List<String> tags = [];

    // サブコレクション内のドキュメントからタグ情報を取得
    querySnapshot.docs.forEach((doc) {
      final data =
          doc.data() as Map<String, dynamic>?; // Map<String, dynamic>としてキャスト
      if (data != null && data.containsKey("tag")) {
        tags.add(data["tag"].toString());
      }
    });

    // タグ情報をログに出力
    print("Fetched tags: $tags");

    return tags;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.greenAccent),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: Center(
          child: Container(
        width: _screenSize.width,
        height: _screenSize.height,
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(6),
                width: _screenSize.width * 0.9,
                height: _screenSize.height * 0.6,
                child: Column(
                  children: [
                    Text(
                      storeName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      children: [
                        LikeButton(),
                        Wrap(
                          spacing: 8, // タグ間のスペース
                          children: formattedTags != null &&
                                  formattedTags.isNotEmpty
                              ? formattedTags.map((formattedTag) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    margin: EdgeInsets.all(2.0),
                                    child: Center(
                                      child: Text(
                                        formattedTag,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList()
                              : [], // tags が null または空の場合は空のリストを使用して非表示にする
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: storePhotoUrl
                              .isNotEmpty // storePhotoUrl が空でない場合の条件
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(5), // 角の丸みを指定
                              child: Image.network(
                                storePhotoUrl, // 画像のURL
                                width: _screenSize.width * 0.8, // 幅
                                fit: BoxFit.cover, // 画像の表示方法を指定
                              ),
                            )
                          : Container(), // storePhotoUrl が空の場合は何も表示しない
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Text(
                          storeDetail,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StorePage(context: context, documentId: '',), // contextを渡す
                            ),
                          );
                        },
                        child: Text("くわしくみる"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                width: _screenSize.width * 0.7,
                child: OutlinedButton(
                  onPressed: _fetchData,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent, // 背景色

                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18), // パディング
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 角の丸み
                    ),
                    side: BorderSide(color: Colors.black87), // 枠線の色
                  ),
                  child: Text(
                    'お店を探す',
                    style: TextStyle(
                      fontSize: 22, // フォントサイズ
                      color: Colors.black87, // テキストの色（上記の primary と同じ）
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class LikeButton extends StatefulWidget {
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
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      onPressed: _toggleLike,
    );
  }
}
