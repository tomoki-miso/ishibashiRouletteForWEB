import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/style/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoreListPage extends StatefulWidget {

  const StoreListPage({
    required this.documentId,
    Key? key,
  }) : super(key: key);
  final String documentId;

  @override
  _StoreListPageState createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  List<String> formattedTags = [];
  String storeName = ''; // 仮の初期値
  String storeDetail = ''; // 仮の初期値
  String storePhotoUrl = ''; // 仮の初期値
  String storeWeb = ''; // 仮の初期値
  String storeTabelog = ''; // 仮の初期値
  String storeTwitter = ''; // 仮の初期値
  String storeInsta = ''; // 仮の初期値

  @override
  Future<void> initState() async {
    super.initState();
    await _fetchStoreData(widget.documentId);
  }

  Future<void> _fetchStoreData(String documentId) async {
    final storeSnapshot = await FirebaseFirestore.instance
        .collection('stores')
        .doc(documentId)
        .get();

    if (storeSnapshot.exists) {
      final storeData = storeSnapshot.data();
      if (storeData != null) {
        storeName = storeData['name'] ?? '';
        storeDetail = storeData['detail'] ?? '';
        storeWeb = storeData['web'] ?? '';
        storeTwitter = storeData['twitter'] ?? '';
        storeInsta = storeData['insta'] ?? '';
        storeTabelog = storeData['tabelog'] ?? '';
        storePhotoUrl = storeData['photo_url'] ?? '';

        final tags = await _fetchTags(
          FirebaseFirestore.instance
              .collection('stores')
              .doc(widget.documentId),
        );

        setState(() {
          formattedTags = tags;
        });
      }
    }
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * 0.08),
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
          width: screenSize.width,
          height: screenSize.height,
          color: Colors.greenAccent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: screenSize.width,
                      color: Colors.greenAccent,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(6),
                          width: screenSize.width * 0.9,
                          child: Column(
                            children: [
                              Text(storeName, style: Styles.storeNameStyle),
                              Row(
                                children: [
                                  LikeButton(),
                                  Expanded(
                                    child: Row(
                                      children: formattedTags.isNotEmpty
                                          ? formattedTags
                                              .map(
                                                (formattedTag) => Container(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .symmetric(
                                                          horizontal: 8,),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      4,
                                                    ),
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                  ),
                                                  margin:
                                                      const EdgeInsets.all(2),
                                                  child: Center(
                                                    child: Text(
                                                      formattedTag,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList()
                                          : [],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: storePhotoUrl.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: CachedNetworkImage(
                                          imageUrl: storePhotoUrl,
                                          width: screenSize.width * 0.8,
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
                                  fixedSize: Size(
                                    screenSize.width * 0.8,
                                    screenSize.height * 0.01,
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(124, 252, 0, 0),
                                ),
                                onPressed: () async {
                                  if (await canLaunchUrl(storeWeb as Uri)) {
                                    await launchUrl(storeWeb as Uri);
                                  } else {
                                    throw 'Could not launch $storeWeb';
                                  }
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.public,
                                        ),
                                      ),
                                      TextSpan(text: '公式ウェブサイト'),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                    screenSize.width * 0.8,
                                    screenSize.height * 0.01,
                                  ), backgroundColor: const Color.fromARGB(255, 254, 170, 1),
                                ),
                                onPressed: () async {
                                  if (await canLaunchUrl(storeTabelog as Uri)) {
                                    await launchUrl(storeTabelog as Uri);
                                  } else {
                                    throw 'Could not launch $storeTabelog';
                                  }
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.public,
                                        ),
                                      ),
                                      TextSpan(text: '食べログ'),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                    screenSize.width * 0.8,
                                    screenSize.height * 0.01,
                                  ), backgroundColor: Colors.black,
                                ),
                                onPressed: () async {
                                  if (await canLaunchUrl(storeTwitter as Uri)) {
                                    await launchUrl(storeTwitter as Uri);
                                  } else {
                                    throw 'Could not launch $storeTwitter';
                                  }
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: FaIcon(
                                          FontAwesomeIcons.twitter,
                                        ),
                                      ),
                                      TextSpan(text: 'X(旧Twitter)'),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                    screenSize.width * 0.8,
                                    screenSize.height * 0.01,
                                  ), backgroundColor: const Color.fromARGB(255, 99, 70, 185),
                                ),
                                onPressed: () async {
                                  if (await canLaunchUrl(storeInsta as Uri)) {
                                    await launchUrlString(storeInsta);
                                  } else {
                                    throw 'Could not launch $storeInsta';
                                  }
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: FaIcon(
                                          FontAwesomeIcons.instagram,
                                        ),
                                      ),
                                      TextSpan(text: 'Instagram'),
                                    ],
                                  ),
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
  Widget build(BuildContext context) => IconButton(
      icon: _isLiked
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
      onPressed: _toggleLike,
    );
}
