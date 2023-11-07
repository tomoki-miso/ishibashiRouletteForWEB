import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/store_list.dart';
import 'package:ishibashi/screens/store_details/page/store_list_detail.dart';
import 'package:ishibashi/style/colors.dart';



class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future<void> navigateToStorePage(String documentId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoreListPage(documentId: documentId),
      ),
    );
  }

  Future<String> _fetchTags(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    if (storeData != null && storeData.containsKey('tags')) {
      final formattedTags = (storeData['tags'] as List<dynamic>)
          .map((formattedTags) => formattedTags.toString())
          .join(', ');
      return formattedTags; // 例: "Monday, Tuesday, Wednesday"
    } else {
      return '営業日情報がありません';
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: ColorName.primarySecondary,
        appBar: const OriginalAppBar(),
        body: Center(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('stores').snapshots(),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
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

                  return StoreList(
                    name: name,
                    tags: tags,
                    imageUrl: imageUrl,
                    onTap: () async {
                      // Define what happens when an item is tapped
                      await navigateToStorePage(document.id);
                    },
                    // Pass other data as needed
                  );
                }).toList(),

                
              );
            },
          ),
        ),
      );
}
