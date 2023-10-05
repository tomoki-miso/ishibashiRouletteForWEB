import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'random.dart';



class StorePage extends StatefulWidget {
  final String documentId;
  const StorePage({Key? key, required this.documentId, }) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<String> formattedTags = [];

  @override
  void initState() {
    super.initState();
    _fetchStoreData(widget.documentId);
  }

  Future<void> _fetchStoreData(String documentId) async {
    try {
      final storeSnapshot = await FirebaseFirestore.instance
          .collection('stores')
          .doc(documentId)
          .get();

      if (storeSnapshot.exists) {
        final storeData = storeSnapshot.data();
        if (storeData != null) {
          final storeName = storeData['name'] ?? '';
          final storeDetail = storeData['detail'] ?? '';
          final storeWeb = storeData['web'] ?? '';
          final storeTwitter = storeData['twitter'] ?? '';
          final storeInsta = storeData['insta'] ?? '';
          final storeTabelog = storeData['tabelog'] ?? '';
          final storePhotoUrl = storeData['photoUrl'] ?? '';

          Provider.of<StoreDataProvider>(context, listen: false)
              .setStoreName(storeName);
          Provider.of<StoreDataProvider>(context, listen: false)
              .setStoreDetail(storeDetail);
          Provider.of<StoreDataProvider>(context, listen: false)
              .setStoreWeb(storeWeb);
          Provider.of<StoreDataProvider>(context, listen: false)
              .setStoreTwitter(storeTwitter);
          Provider.of<StoreDataProvider>(context, listen: false)
              .setStoreInsta(storeInsta);
          Provider.of<StoreDataProvider>(context, listen: false)
              .setStoreTabelog(storeTabelog);
          Provider.of<StoreDataProvider>(context, listen: false)
              .setStorePhotoUrl(storePhotoUrl);

          final tags = await _fetchTags(FirebaseFirestore.instance
              .collection('stores')
              .doc(widget.documentId));
          Provider.of<StoreDataProvider>(context, listen: false)
              .setFormattedTags(tags);
        }
      }
    } catch (error) {
      print("Error fetching store data in storespage: $error");
    }
  }

  Future<List<String>> _fetchTags(DocumentReference storeReference) async {
  final storeSnapshot = await storeReference.get();
  final storeData = storeSnapshot.data() as Map<String, dynamic>?;

  // タグ情報を取得
  if (storeData != null && storeData.containsKey("tags")) {
    final tags = storeData["tags"] as List<dynamic>;
    final formattedTags = tags.map((tag) => tag.toString()).toList();
    print("Fetched tags in storespage: $formattedTags");

    

    return formattedTags;
  } else {
    print("Tags field not found or empty.");
    return [];
  }
}


  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    final storeName = context.watch<StoreDataProvider>().storeName;
    final storeDetail = context.watch<StoreDataProvider>().storeDetail;
    final storeWeb = context.watch<StoreDataProvider>().storeWeb;
    final storeTwitter = context.watch<StoreDataProvider>().storeTwitter;
    final storeInsta = context.watch<StoreDataProvider>().storeInsta;
    final storeTabelog = context.watch<StoreDataProvider>().storeTabelog;
    final storePhotoUrl = context.watch<StoreDataProvider>().storePhotoUrl;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.greenAccent),
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
          width: _screenSize.width,
          height: _screenSize.height,
          color: Colors.greenAccent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: _screenSize.width,
                      color: Colors.greenAccent,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 20),
                          width: _screenSize.width * 0.9,
                          child: Column(
                            children: [
                              Text(
                                storeName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              Row(
                        children: [
                          LikeButton(),
                          Wrap(
                            spacing: 8,
                            children: formattedTags.isNotEmpty
                                ? formattedTags.map((formattedTag) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.deepOrangeAccent,
                                      ),
                                      margin: const EdgeInsets.all(2.0),
                                      child: Center(
                                        child: Text(
                                          formattedTag,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList()
                                : [],
                          ),
                        ],
                      ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: storePhotoUrl.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          storePhotoUrl,
                                          width: _screenSize.width * 0.8,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Container(),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  storeDetail,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(_screenSize.width * 0.8,
                                      _screenSize.height * 0.01),
                                  primary: const Color.fromARGB(124, 252, 0, 0),
                                ),
                                onPressed: () async {
                                  if (await canLaunch(storeWeb)) {
                                    await launch(storeWeb);
                                  } else {
                                    throw 'Could not launch $storeWeb';
                                  }
                                },
                                child: RichText(
                                  text: const TextSpan(children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.public,
                                      ),
                                    ),
                                    TextSpan(text: "公式ウェブサイト"),
                                  ]),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(_screenSize.width * 0.8,
                                      _screenSize.height * 0.01),
                                  primary: const Color.fromARGB(255, 254, 170, 1),
                                ),
                                onPressed: () async {
                                  if (await canLaunch(storeTabelog)) {
                                    await launch(storeTabelog);
                                  } else {
                                    throw 'Could not launch $storeTabelog';
                                  }
                                },
                                child: RichText(
                                  text: const TextSpan(children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.public,
                                      ),
                                    ),
                                    TextSpan(text: "食べログ"),
                                  ]),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(_screenSize.width * 0.8,
                                      _screenSize.height * 0.01),
                                  primary: Colors.black,
                                ),
                                onPressed: () async {
                                  if (await canLaunch(storeTwitter)) {
                                    await launch(storeTwitter);
                                  } else {
                                    throw 'Could not launch $storeTwitter';
                                  }
                                },
                                child: RichText(
                                  text: const TextSpan(children: [
                                    WidgetSpan(
                                      child: FaIcon(
                                        FontAwesomeIcons.twitter,
                                      ),
                                    ),
                                    TextSpan(text: "X(旧Twitter)"),
                                  ]),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(_screenSize.width * 0.8,
                                      _screenSize.height * 0.01),
                                  primary: const Color.fromARGB(255, 99, 70, 185),
                                ),
                                onPressed: () async {
                                  if (await canLaunch(storeInsta)) {
                                    await launch(storeInsta);
                                  } else {
                                    throw 'Could not launch $storeInsta';
                                  }
                                },
                                child: RichText(
                                  text: const TextSpan(children: [
                                    WidgetSpan(
                                      child: FaIcon(
                                        FontAwesomeIcons.instagram,
                                      ),
                                    ),
                                    TextSpan(text: "Instagram"),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isLiked ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
      onPressed: _toggleLike,
    );
  }
}
