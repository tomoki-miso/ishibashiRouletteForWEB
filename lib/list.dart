import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'stores.dart';
import 'search.dart';
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
         builder: (context) => StorePage(documentId: documentId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchConfirmPage()),
                  );
                },
                icon: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Color.fromARGB(255, 62, 61, 61),
                ))
          ],
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.greenAccent,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection("stores").snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot<Map<String, dynamic>> document) {
                  return Card(
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.only(left: 16.0), // 左右の余白を設定
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(document.data()!['name']),
                          IconButton(
                            icon: Icon(Icons.chevron_right),
                            onPressed: () {
                              navigateToStorePage(document.id);
                            },
                          ),
                        ],
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
