import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/stores.dart';

class KeywordSearchPage extends StatefulWidget {
  const KeywordSearchPage({Key? key}) : super(key: key);

  @override
  _KeywordSearchPageState createState() => _KeywordSearchPageState();
}

class _KeywordSearchPageState extends State<KeywordSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _searchResults = [];
  final daysOfWeek = [
    '月',
    '火',
    '水',
    '木',
    '金',
    '土',
    '日',
  ];

  // フレンドを検索する関数
  void _searchKeyword(String searchText) async {
    final searchTextList = [searchText]; // searchText をリストに変換

    final querySnapshot = await _firestore
        .collection('stores')
        .where('keywords', arrayContainsAny: searchTextList)
        .get();

    print('検索結果のドキュメント数: ${querySnapshot.docs.length}');

    setState(() {
      _searchResults = querySnapshot.docs;
    });
  }

  Future<List<String>> _fetchTags(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    // タグ情報を取得
    if (storeData != null && storeData.containsKey("tags")) {
      final tags = storeData["tags"] as List<dynamic>;
      final formattedTags = tags.map((tag) => tag.toString()).toList();
      print("Fetched tags: $formattedTags");
      return formattedTags;
    } else {
      print("Tags field not found or empty.");
      return [];
    }
  }

  Future<String> _fetchOpenDays(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    if (storeData != null && storeData.containsKey("daysOfWeek")) {
      final openDays = (storeData["daysOfWeek"] as List<dynamic>)
          .map((openDay) => openDay.toString())
          .join(", ");
      print("days: $openDays");
      return openDays; // 例: "Monday, Tuesday, Wednesday"
    } else {
      print("営業日取得失敗");
      return "営業日情報がありません";
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.greenAccent),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children: [
          // 検索ボックス
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 36,
            ),
            child: TextField(
              controller: _searchController,
              style: TextStyle(fontSize: 16, fontFamily: "KiwiMaru"),
              decoration: InputDecoration(
                hintText: '店名、カテゴリーなどを入力',
              ),
              onChanged: (value) {
                _searchKeyword(value);
              },
            ),
          ),
          // 検索結果を表示
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final record = _searchResults[index];
                final recordData = record.data() as Map<String, dynamic>;
                final name = recordData['name'] as String;
                final detail = recordData['detail'] as String;
                final storePhotoUrl = recordData['photo_url'] as String;

                return FutureBuilder<List<String>>(
                  // _fetchTags メソッドでタグを非同期に取得
                  future: _fetchTags(record.reference),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // ローディングインジケーターを表示
                    } else if (snapshot.hasError) {
                      return Text('エラー: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('タグはありません');
                    }

                    final formattedTags = snapshot.data;

                    return InkWell(
                      onTap: () {
                        // ドキュメントIDを詳細画面に渡す
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StorePage(
                              documentId: record.id,
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 20,
                                width: size.width * 0.95,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.all(10)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "KaiseiDecol"),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Container(
                                    width: size.width * 0.95,
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: size.width * 0.45,
                                              width: size.width * 0.45,
                                              padding: EdgeInsets.only(left: 8),
                                              child: storePhotoUrl.isNotEmpty
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: CachedNetworkImage(
                                                        imageUrl: storePhotoUrl,
                                                        width: size.width * 0.8,
                                                        fit: BoxFit.cover,
                                                      ))
                                                  : Container(),
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.all(10)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(padding: EdgeInsets.all(8)),
                                            Container(
                                              height: size.height * 0.03,
                                              width: size.width * 0.38,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Wrap(
                                                direction: Axis.vertical,
                                                spacing: 100,
                                                children: formattedTags!
                                                        .isNotEmpty
                                                    ? formattedTags
                                                        .map((formattedTag) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 2),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                              color: Colors
                                                                  .deepOrangeAccent,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                formattedTag,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList()
                                                    : [
                                                        Text("タグがありません")
                                                      ], // タグが空の場合のデフォルト表示
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.all(1)),
                                            Text("営業日"),
                                            Container(
                                              child: FutureBuilder<String>(
                                                // _fetchOpenTime メソッドで営業時間を非同期に取得
                                                future: _fetchOpenDays(
                                                    record.reference),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return CircularProgressIndicator(); // ローディングインジケーターを表示
                                                  } else if (snapshot
                                                      .hasError) {
                                                    return Text(
                                                        'エラー: ${snapshot.error}');
                                                  }

                                                  final openDays =
                                                      snapshot.data;

                                                  return Container(
                                                    height: size.height * 0.06,
                                                    width: size.width * 0.38,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          left: 8,
                                                          right: 5),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .greenAccent),
                                                      child: Text(
                                                        openDays!,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.all(4)),
                                            Container(
                                              height: size.height * 0.1,
                                              width: size.width * 0.38,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.greenAccent,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  detail,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.all(6))
                                          ],
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}