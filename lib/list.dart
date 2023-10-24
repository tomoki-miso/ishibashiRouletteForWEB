import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ishibashi/style/styles.dart';

import 'searchconfirm.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void navigateToStorePage(String documentId) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => StorePage(documentId: documentId),
    //   ),
    // );
  }

  Future<List<String>> _fetchTags(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    // タグ情報を取得
    if (storeData != null && storeData.containsKey("tags")) {
      final tags = storeData["tags"] as List<dynamic>;
      final formattedTags = tags.map((tag) => tag.toString()).toList();
      return formattedTags;
    } else {
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
      return openDays; // 例: "Monday, Tuesday, Wednesday"
    } else {
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
                              const Padding(padding: EdgeInsets.all(10)),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(name, style: Styles.storeNameStyle),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
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
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: imageUrl.isNotEmpty
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
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
                                    const Padding(padding: EdgeInsets.all(10)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.all(8)),
                                        Container(
                                          height: size.height * 0.03,
                                          width: size.width * 0.38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Wrap(
                                            direction: Axis.vertical,

                                            children: tags != null &&
                                                    tags.isNotEmpty
                                                ? tags.map((formattedTag) {
                                                    return Container(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .symmetric(
                                                              horizontal: 4),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          formattedTag
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList()
                                                : [
                                                    const Text("タグがありません")
                                                  ], // Display default text if tags are empty
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(1)),
                                        const Text("営業日"),
                                        Container(
                                          child: FutureBuilder<String>(
                                            future: _fetchOpenDays(
                                                document.reference),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const CircularProgressIndicator();
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
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                    style: const TextStyle(
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
                                        const Padding(
                                            padding: EdgeInsets.all(4)),
                                        Container(
                                          height: size.height * 0.1,
                                          width: size.width * 0.38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                        const Padding(
                                            padding: EdgeInsets.all(6))
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
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
