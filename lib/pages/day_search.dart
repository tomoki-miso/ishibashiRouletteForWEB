import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/pages/store_list_detail.dart';
import 'package:ishibashi/style/styles.dart';

class DaySearchPage extends StatefulWidget {
  const DaySearchPage({Key? key});

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

  Future<void> _searchDays() async {
    if (selectedDays.isNotEmpty) {
      final querySnapshot = await _firestore
          .collection('stores')
          .where('daysOfWeek', arrayContainsAny: selectedDays)
          .get();

      setState(() {
        _searchResults = querySnapshot.docs;
      });
    } else {
      setState(() {
        _searchResults.clear();
      });
    }
  }

  Future<List<String>> _fetchTags(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    if (storeData != null && storeData.containsKey('tags')) {
      final tags = storeData['tags'] as List<dynamic>;
      final formattedTags = tags.map((tag) => tag.toString()).toList();
      return formattedTags;
    } else {
      return [];
    }
  }

  Future<String> _fetchOpenDays(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    if (storeData != null && storeData.containsKey('daysOfWeek')) {
      final openDays = (storeData['daysOfWeek'] as List<dynamic>)
          .map((openDay) => openDay.toString())
          .join(', ');
      return openDays;
    } else {
      return '営業日情報がありません';
    }
  }

  void _handleDaySelection(String day) async {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }

    await _searchDays(); // 非同期処理を実行

    setState(() {
      // ここで状態を更新
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
          Container(
            width: size.width * 0.85,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.greenAccent,
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(3),
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: daysOfWeek.map((day) {
                    final isSelected = selectedDays.contains(day);
                    return InkWell(
                      onTap: () {
                        _handleDaySelection(day);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          border: Border.all(
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
          Expanded(
            child: selectedDays.isEmpty && _searchResults.isEmpty
                ? const Center(
                    child: Text(
                      '曜日を選択してください',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : selectedDays.isNotEmpty && _searchResults.isEmpty
                    ? const Center(
                        child: Text(
                          '選択された曜日に営業しているお店はありません',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final record = _searchResults[index];
                          final recordData = record.data() as Map<String, dynamic>;
                          final name = recordData['name'] as String;
                          final detail = recordData['detail'] as String;
                          final storePhotoUrl = recordData['photo_url'] as String;

                          return FutureBuilder<List<String>>(
                            future: _fetchTags(record.reference),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('エラー: ${snapshot.error}');
                              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Text('タグはありません');
                              }

                              final formattedTags = snapshot.data;

                              return InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StoreListPage(
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
                                            const Padding(padding: EdgeInsets.all(10),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10,
                                              ),
                                              child: Text(
                                                name,
                                                style: Styles.storeNameStyle,
                                              ),
                                            ),
                                            const Padding(padding: EdgeInsets.all(4),
                                            ),
                                            Container(
                                              width: size.width * 0.95,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: size.width * 0.45,
                                                        width: size.width * 0.45,
                                                        padding: const EdgeInsets.only(left: 8,
                                                        ),
                                                        child: storePhotoUrl.isNotEmpty
                                                            ? ClipRRect(
                                                                borderRadius: BorderRadius.circular(5),
                                                                child: CachedNetworkImage(
                                                                  imageUrl: storePhotoUrl,
                                                                  width: size.width * 0.8,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              )
                                                            : Container(),
                                                      ),
                                                    ],
                                                  ),
                                                  const Padding(padding: EdgeInsets.all(10),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Padding(padding: EdgeInsets.all(8),
                                                      ),
                                                      Container(
                                                        height: size.height * 0.03,
                                                        width: size.width * 0.38,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        child: Wrap(
                                                          direction: Axis.vertical,
                                                          spacing: 100,
                                                          children: formattedTags!.isNotEmpty
                                                              ? formattedTags.take(2).map((formattedTag) =>
                                                                  Container(
                                                                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(4),
                                                                      color: Colors.deepOrangeAccent,
                                                                    ),
                                                                    margin: const EdgeInsets.all(1),
                                                                    child: Center(
                                                                      child: Text(
                                                                        formattedTag,
                                                                        style: const TextStyle(
                                                                          fontSize: 12,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ).toList()
                                                              : [],
                                                        ),
                                                      ),
                                                      const Padding(padding: EdgeInsets.all(1),
                                                      ),
                                                      const Text('営業日'),
                                                      FutureBuilder<String>(
                                                        future: _fetchOpenDays(record.reference),
                                                        builder: (context, snapshot) {
                                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                                            return const CircularProgressIndicator();
                                                          } else if (snapshot.hasError) {
                                                            return Text('エラー: ${snapshot.error}');
                                                          }

                                                          final openDays = snapshot.data;

                                                          return Container(
                                                            height: size.height * 0.06,
                                                            width: size.width * 0.38,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(20),
                                                            ),
                                                            child: Container(
                                                              padding: const EdgeInsets.only(top: 10, left: 8, right: 5,
                                                              ),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                color: Colors.greenAccent,
                                                              ),
                                                              child: Text(
                                                                openDays!,
                                                                style: const TextStyle(
                                                                  fontSize: 12,
                                                                ),
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      const Padding(padding: EdgeInsets.all(4),
                                                      ),
                                                      Container(
                                                        height: size.height * 0.1,
                                                        width: size.width * 0.38,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: Colors.greenAccent,
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5),
                                                          child: Text(
                                                            detail,
                                                            style: const TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 3,
                                                          ),
                                                        ),
                                                      ),
                                                      const Padding(padding: EdgeInsets.all(6),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
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
