import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'stores.dart'; // StorePage へのナビゲーション用のインポート

class ResultPage extends StatelessWidget {
  final List<QueryDocumentSnapshot> stores; // コンストラクタの引数を変更
  final List<String> selectedDays;
  final List<String> selectedTags;

  ResultPage(this.stores, this.selectedDays, this.selectedTags); // コンストラクタを修正

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: ListView.builder(
          itemCount: stores.length, // storesの長さを使用
          itemBuilder: (context, index) {
            final document = stores[index];
            final name = document['name'];

            // 選択された曜日とタグに基づいてフィルタリング
            bool shouldDisplay = true;
            if (selectedDays.isNotEmpty) {
              shouldDisplay = shouldDisplay &&
                  selectedDays
                      .any((day) => document['daysOfWeek'].contains(day));
            }
            if (selectedTags.isNotEmpty) {
              shouldDisplay = shouldDisplay &&
                  selectedTags.any((tag) => document['tags'].contains(tag));
            }

            if (shouldDisplay) {
              return Card(
                child: ListTile(
                  title: Text('$name'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      navigateToStorePage(context, document.id);
                    },
                  ),
                ),
              );
            } else {
              return Container(
                  color: Colors.white, child: Text("not found")); // 非表示にする
            }
          },
        ),
      ),
    );
  }

  void navigateToStorePage(BuildContext context, String documentId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StorePage(documentId: documentId)),
    );
  }
}
