import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
    this.querySnapshot,
    this.selectedDays,
    this.selectedTags, {
    super.key,
  });
  final QuerySnapshot querySnapshot;
  final List<String> selectedDays;
  final List<String> selectedTags;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Search Result'),
        ),
        body: ColoredBox(
          color: Colors.greenAccent,
          child: ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              final document = querySnapshot.docs[index];
              final name = document['name'];

              // 選択された曜日が存在しないか、選択された曜日とドキュメント内の曜日が一致する場合のみ表示
              if (selectedDays.isEmpty ||
                  selectedDays.any(
                    (day) =>
                        document['daysOfWeek'].contains(day) &&
                            selectedTags.isEmpty ||
                        selectedTags
                            .any((tag) => document['tags'].contains(tag)),
                  )) {
                return Card(
                  child: ListTile(
                    title: Text('$name'),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // navigateToStorePage(context, document.id);
                      },
                    ),
                  ),
                );
              } else {
                return const Text(
                  '404 Not Found!!',
                  style: TextStyle(color: Colors.white),
                ); // 表示されない場合は空のコンテナを返す
              }
            },
          ),
        ),
      );

//   void navigateToStorePage(BuildContext context, String documentId) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => StorePage(documentId: documentId)),
//     );
//   }
}
