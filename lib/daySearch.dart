import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'stores.dart';

class DaySearchPage extends StatefulWidget {
  const DaySearchPage({Key? key}) : super(key: key);

  @override
  _DaySearchPageState createState() => _DaySearchPageState();
}

class _DaySearchPageState extends State<DaySearchPage> {
  List<String> selectedDays = [];
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
  void _search() async {
    if (selectedDays.isNotEmpty) {
      final querySnapshot = await _firestore
          .collection('stores')
          .where('daysOfWeek', arrayContainsAny: selectedDays)
          .get();

      print('検索結果のドキュメント数: ${querySnapshot.docs.length}');

      setState(() {
        _searchResults = querySnapshot.docs;
      });
    } else {
      // 選択された曜日が空の場合、リストをクリア
      setState(() {
        _searchResults.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC5E4FC),
      ),
      body: Container(
        width: size.width,
        color: Colors.greenAccent,
        child: Column(
          children: [
            Container(
              width: size.width * 0.85,
              height: size.height * 0.1, // 高さ
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(3),
                  child: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: daysOfWeek.map((day) {
                      final isSelected = selectedDays.contains(day);
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedDays.remove(day);
                            } else {
                              selectedDays.add(day);
                            }
                            _search();
                            print('選択中の曜日: $selectedDays');
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            border: Border.all(
                              width: 1,
                              color: Colors.pink,
                            ),
                            color: isSelected ? Colors.pink : null,
                          ),
                          child: Text(
                            day,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.pink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
      
            // 検索結果を表示
            Expanded(
              child: selectedDays.isEmpty &&
                      _searchResults.isEmpty // _searchResults が空の場合
                  ? Center(
                      child: Text(
                        '曜日を選択してください',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : selectedDays.isNotEmpty && _searchResults.isEmpty
                      ? Center(
                          child: Text(
                            '選択された曜日に営業しているお店はありません',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final record = _searchResults[index];
                            final recordData =
                                record.data() as Map<String, dynamic>;
                            final name = recordData['name'] as String;
                            final storePhotoUrl =
                                recordData['photo_url'] as String;
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      child: storePhotoUrl
                                                              .isNotEmpty
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child:
                                                                  Image.network(
                                                                storePhotoUrl,
                                                                width:
                                                                    size.width *
                                                                        0.8,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            )
                                                          : Container(),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.all(8)),
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
                                                            BorderRadius.circular(
                                                                20),
                                                        color: Color.fromARGB(
                                                            255, 197, 228, 252),
                                                      ),
                                                      child: Center(
                                                          child: Text(name)),
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
                                                            BorderRadius.circular(
                                                                20),
                                                        color: Color.fromARGB(
                                                            255, 197, 228, 252),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 10,
                                                            left: 8,
                                                            right: 5),
                                                        child: Text(
                                                          detail,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(8))
                                                  ],
                                                ),
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2)),
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
      ),
    );
  }
}
