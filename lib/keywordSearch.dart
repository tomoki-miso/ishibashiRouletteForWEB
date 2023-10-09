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
                final storePhotoUrl = recordData['photo_url'] as String;
                final detail = recordData['detail'] as String;
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
                              Container(
                                width: size.width * 0.95,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: size.width * 0.45,
                                          width: size.width * 0.45,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: storePhotoUrl.isNotEmpty
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: CachedNetworkImage(
                                                    imageUrl: storePhotoUrl,
                                                    width: size.width * 0.8,
                                                    fit: BoxFit.cover,
                                                  ))
                                              : Container(),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 2,
                                          width: 160,
                                        ),
                                        Text("天気"),
                                        Container(
                                          height: size.height * 0.1,
                                          width: size.width * 0.38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color.fromARGB(
                                                255, 197, 228, 252),
                                          ),
                                          child: Center(child: Text(name)),
                                        ),
                                        SizedBox(
                                          height: 3,
                                          width: 160,
                                        ),
                                        Text("メモ"),
                                        Container(
                                          height: size.height * 0.1,
                                          width: size.width * 0.38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color.fromARGB(
                                                255, 197, 228, 252),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 8, right: 5),
                                            child: Text(
                                              detail,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(8))
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
                          SizedBox(
                            height: 2,
                            width: 420,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
