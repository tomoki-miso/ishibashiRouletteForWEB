import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/components/original_app_bar.dart';

import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/screens/store_details/page/store_detail.dart';

import 'package:ishibashi/style/colors.dart';

class DaySearchPage extends StatefulWidget {
  const DaySearchPage({super.key});

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

  Future<void> navigateToStorePage(String documentId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoreDetailPage(documentId: documentId),
      ),
    );
  }

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

  Future<void> _handleDaySelection(String day) async {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }

    await _searchDays(); // 非同期処理を実行

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.backGroundYellow,
      appBar: const OriginalAppBar(),
      body: Column(
        children: [
          Container(
            width: size.width * 0.85,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorName.whiteBase,
            ),
            margin: const EdgeInsets.symmetric(vertical: 18),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3),
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                children: daysOfWeek.map((day) {
                  final isSelected = selectedDays.contains(day);
                  return InkWell(
                    onTap: () async {
                      await _handleDaySelection(day);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: ColorName.brightRed, width: 2),
                          color: isSelected ? ColorName.brightRed : null,
                        ),
                        child: CircleAvatar(
                          backgroundColor: isSelected
                              ? ColorName.brightRed
                              : ColorName.whiteBase,
                          child: Text(
                            day,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : ColorName.brightRed,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
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
                    : Center(
                        child:
                            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('stores')
                              .snapshots(),
                          builder: (
                            context,
                            snapshot,
                          ) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (!snapshot.hasData) {
                              return const Center(child: Text('データなし'));
                            }
                            return ListView(
                              children: snapshot.data!.docs.map((document) {
                                final data = document.data();

                                // Extract store data
                                final name = data['name'] as String;
                                final imageUrl = data['photo_url'] as String;
                                final tags = data['tags'] as List<dynamic>;

                                final openTime =
                                    data['formattedOpenTime'] as String?;
                                final closeTime =
                                    data['formattedCloseTime'] as String?;

                                return StoreList(
                                  name: name,
                                  tags: tags,
                                  imageUrl: imageUrl,
                                  openTime: openTime,
                                  closeTime: closeTime,
                                  onTap: () async {
                                    await navigateToStorePage(document.id);
                                  },
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
