import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'stores.dart';

class StoreDataProvider with ChangeNotifier {
  String storeName = '';
  String storeDetail = '';
  List<String> formattedTags = [];
  String storePhotoUrl = '';
  String storeWeb = '';
  String storeTwitter = '';
  String storeInsta = '';
  String storeTabelog = '';

  void setStoreName(String name) {
    storeName = name;
    notifyListeners();
  }

  void setStoreDetail(String detail) {
    storeDetail = detail;
    notifyListeners();
  }

  void setFormattedTags(List<String> tags) {
    formattedTags = tags; // タグを設定
    notifyListeners();
  }

  void setStorePhotoUrl(String photoUrl) {
    storePhotoUrl = photoUrl;
    notifyListeners();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => StoreDataProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: RandomPage(),
    );
  }
}

class RandomPage extends StatefulWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    print("Fetching data...");

    final storeSnapshot =
        await FirebaseFirestore.instance.collection('stores').get();
    final storeIds =
        List.generate(storeSnapshot.docs.length, (index) => index + 1);
    storeIds.shuffle();
    storeIds.removeAt(0);
    final storeId = storeIds.first;

    final storeData = storeSnapshot.docs[storeId - 1].data();
    final storeNameData = storeData?['name'] ?? '';
    final storeDetailData = storeData?['detail'] ?? '';
    final storePhotoUrlData = storeData?['photoUrl'] ?? '';

    final tags = await _fetchTags(storeSnapshot.docs[storeId - 1].reference);

    Provider.of<StoreDataProvider>(context, listen: false)
        .setStoreName(storeNameData);
    Provider.of<StoreDataProvider>(context, listen: false)
        .setStoreDetail(storeDetailData);
    Provider.of<StoreDataProvider>(context, listen: false).setFormattedTags(tags);
    Provider.of<StoreDataProvider>(context, listen: false)
        .setStorePhotoUrl(storePhotoUrlData);

    setState(() {
      // ステートの更新は必要ないので削除
    });
  }

  Future<List<String>> _fetchTags(DocumentReference storeReference) async {
    final QuerySnapshot querySnapshot =
        await storeReference.collection('tags').get();

    final List<String> tags = [];

    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey("tag")) {
        tags.add(data["tag"].toString());
      }
    });

    return tags;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.greenAccent),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: _screenSize.width,
          height: _screenSize.height,
          color: Colors.greenAccent,
          child: Center(
            child: Column(
              children: [
                Consumer<StoreDataProvider>(
                  builder: (context, provider, _) {
                    final storeName = provider.storeName;
                    final formattedTags = provider.formattedTags;

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(6),
                      width: _screenSize.width * 0.9,
                      height: _screenSize.height * 0.6,
                      child: Column(
                        children: [
                          Text(
                            storeName,
                            style: TextStyle(
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
                                children: formattedTags != null && formattedTags.isNotEmpty
                                    ? formattedTags.map((formattedTag) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.0),
                                            color: Colors.deepOrangeAccent,
                                          ),
                                          margin: EdgeInsets.all(2.0),
                                          child: Center(
                                            child: Text(
                                              formattedTag,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList()
                                    : [],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: provider.storePhotoUrl.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      provider.storePhotoUrl,
                                      width: _screenSize.width * 0.8,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Text(
                                provider.storeDetail,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StorePage(
                                      context: context,
                                      documentId: '',
                                    ),
                                  ),
                                );
                              },
                              child: Text("くわしくみる"),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: _screenSize.width * 0.7,
                  child: OutlinedButton(
                    onPressed: _fetchData,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Colors.black87),
                    ),
                    child: Text(
                      'お店を探す',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                )
              ],
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
      icon: _isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      onPressed: _toggleLike,
    );
  }
}
