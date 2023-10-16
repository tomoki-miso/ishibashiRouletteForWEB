import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'stores.dart';
import 'searchconfirm.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void navigateToStorePage(String documentId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StorePage(documentId: documentId),
      ),
    );
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchConfirmPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Color(0xFF3E3D3D),
              ),
            )
          ],
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
         
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection("stores").snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot<Map<String, dynamic>> document) {
                  final data = document.data()!;

                  // Extract store data
                  final name = data['name'] as String;
                  final imageUrl = data['photo_url'] as String;
                  final tags = data['tags'] as List<dynamic>?;
                  final detail = data['detail'] as String;

                  return InkWell(
                    onTap: () {
                      // Navigate to the store page
                      navigateToStorePage(document.id);
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
                                      fontFamily: "KaiseiDecol",
                                    ),
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
                                            child: imageUrl.isNotEmpty
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: CachedNetworkImage(
                                                      imageUrl: imageUrl,
                                                      width: size.width * 0.8,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
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
                                              children: tags != null &&
                                                      tags.isNotEmpty
                                                  ? tags.map((formattedTag) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 2),
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
                                                              formattedTag
                                                                  .toString(),
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
                                                    ], // Display default text if tags are empty
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.all(1)),
                                          Text("営業日"),
                                          Container(
                                            child: FutureBuilder<String>(
                                              future: _fetchOpenDays(
                                                  document.reference),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      'エラー: ${snapshot.error}');
                                                }
                                                final openDays = snapshot.data;

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
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.greenAccent,
                                                    ),
                                                    child: Text(
                                                      openDays!,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                overflow: TextOverflow.ellipsis,
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
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
