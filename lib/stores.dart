import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



//class StorePage extends StatelessWidget {final String documentId; // FirestoreのドキュメントIDを保持する変数StorePage({required this.documentId, Key? key}) : super(key: key);

import 'random.dart'; // インポートパスを確認してください

class StorePage extends StatefulWidget {
  final BuildContext context; // コンテキストを受け取る
  final String documentId;
  const StorePage({Key? key, required this.context,required this.documentId}) : super(key: key);


  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
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
          iconTheme: IconThemeData(color: Colors.greenAccent),
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
                                storeName, // 正しいプロバイダーから取得
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),

                              ),
                              Row(
                                children: [
                                  LikeButton(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    margin: EdgeInsets.all(2.0),
                                    width: _screenSize.width * 0.15,
                                    child: Center(
                                      child: Text(
                                        '#喫茶店',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),

                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: storePhotoUrl
                                        .isNotEmpty // storePhotoUrl が空でない場合の条件
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5), // 角の丸みを指定
                                        child: Image.network(
                                          storePhotoUrl, // 画像のURL
                                          width: _screenSize.width * 0.8, // 幅
                                          fit: BoxFit.cover, // 画像の表示方法を指定
                                        ),
                                      )
                                    : Container(), // storePhotoUrl が空の場合は何も表示しない
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  storeDetail,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(_screenSize.width * 0.8,
                                      _screenSize.height * 0.01),
                                  primary: Color.fromARGB(124, 252, 0, 0),
                                ),
                                onPressed: () async {
                                  if (await canLaunch(storeWeb)) {
                                    await launch(storeWeb);
                                  } else {
                                    throw 'Could not launch $storeWeb';
                                  }
                                },
                                child: RichText(
                                  text: TextSpan(children: [
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
                                  primary: Color.fromARGB(255, 254, 170, 1),
                                ),
                                onPressed: () async {
                                  if (await canLaunch(storeTabelog)) {
                                    await launch(storeTabelog);
                                  } else {
                                    throw 'Could not launch $storeTabelog';
                                  }
                                },
                                child: RichText(
                                  text: TextSpan(children: [
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
                                  text: TextSpan(children: [
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
                                  primary: Color.fromARGB(255, 99, 70, 185),
                                ),
                                onPressed: () async {
                                  if (await canLaunch(storeInsta)) {
                                    await launch(storeInsta);
                                  } else {
                                    throw 'Could not launch $storeInsta';
                                  }
                                },
                                child: RichText(
                                  text: TextSpan(children: [
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
      icon: _isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      onPressed: _toggleLike,
    );
  }
}

class LinkButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;

  const LinkButton({
    required this.icon,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(icon),
            ),
            TextSpan(
              text: " $text",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
