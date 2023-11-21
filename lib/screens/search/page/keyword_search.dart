import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/screens/store_details/page/store_list_detail.dart';

class KeywordSearchPage extends StatefulWidget {
  const KeywordSearchPage({super.key});

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

  Future<void> navigateToStorePage(String documentId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoreListPage(documentId: documentId),
      ),
    );
  }

  Future<void> _searchKeyword(String searchText) async {
    final searchTextList = [searchText]; // searchText をリストに変換

    final querySnapshot = await _firestore
        .collection('stores')
        .where('keywords', arrayContainsAny: searchTextList)
        .get();

    setState(() {
      _searchResults = querySnapshot.docs;
    });
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

  Future<String> _fetchOpenDays(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    if (storeData != null && storeData.containsKey('daysOfWeek')) {
      final openDays = (storeData['daysOfWeek'] as List<dynamic>)
          .map((openDay) => openDay.toString())
          .join(', ');
      return openDays; // 例: "Monday, Tuesday, Wednesday"
    } else {
      return '営業日情報がありません';
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const OriginalAppBar(),
        body: Column(
          children: [
            // Search Box
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 36,
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(fontSize: 16, fontFamily: 'KiwiMaru'),
                decoration: const InputDecoration(
                  hintText: '店名、カテゴリーなどで検索',
                ),
                onChanged: (value) async {
                  await _searchKeyword(value);
                },
              ),
            ),
            
            // 検索結果
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final document =
                      _searchResults[index].data() as Map<String, dynamic>;

                  final name = document['name'] as String;
                  final imageUrl = document['photo_url'] as String;
                  final tags = document['tags'] as List<dynamic>;

                  return StoreList(
                    name: name,
                    tags: tags,
                    imageUrl: imageUrl,
                    onTap: () async {
                      await navigateToStorePage(_searchResults[index].id);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
}
