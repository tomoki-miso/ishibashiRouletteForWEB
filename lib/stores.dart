import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

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
                                    borderRadius:
                                        BorderRadius.circular(5.0), // 角を丸くする
                                    color: Colors.white,
                                  ),
                                  margin: const EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                                  width: _screenSize.width * 0.9,
                                  child: Column(
                                    children: [
                                      Text(
                                        "いしばしや＆KEY'S CAFE 石橋駅前店", // 表示するテキスト
                                        style: TextStyle(
                                          fontSize: 18, // フォントサイズ
                                          fontWeight:
                                              FontWeight.bold, // フォントの太さ
                                          color: Colors.black54, // テキストの色
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          LikeButton(),
                    
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      4.0), // 角を丸くする
                                              color: Colors.deepOrangeAccent,
                                            ),
                                            margin: EdgeInsets.all(2.0),
                                            width: _screenSize.width * 0.15,
                                            child: Center(
                                              child: Text(
                                                '#喫茶店',
                                                style: TextStyle(
                                                  fontSize: 12, // フォントサイズ
                                                  color: Colors.white, // テキストの色
                                                ),
                                              ),
                                            ),
                                          ), //タグ
                                        ], //タグのある列のグループ
                                      ),
                                      SizedBox(height: 16),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://www.ss-ishibashi.jp/wp-content/uploads/2014/03/f260a701c32672bf1b5b2899adf3a9fe-600x450.jpg',
                                          width: _screenSize.width * 0.8,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          '石橋駅を降りてスグ！！なつかしい町、石橋。ふれあいの街、石橋商店街。小物達との出会いの”いしばしや”。豊富な品揃えで何でもそろう下町のセレクトショップです。駅前の待ち合わせや雨宿りにもご利用くださいませ。',
                                        ),
                                      ),
                    
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(
                                                _screenSize.width * 0.8,
                                                _screenSize.height * 0.01),
                                          primary: Color.fromARGB(124, 252, 0, 0)),
                                        onPressed: () async {
                                          final url =
                                              'https://www.ss-ishibashi.jp/guide/20140327/526';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
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
                                        ])),
                                      ),
                    
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(
                                                _screenSize.width * 0.8,
                                                _screenSize.height * 0.01),
                                            primary: Color.fromARGB(255,254 , 170, 1)),
                                        onPressed: () async {
                                          final url =
                                              'https://tabelog.com/osaka/A2706/A270603/27095028/';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
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
                                        ])),
                                      ),
                    
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(
                                                _screenSize.width * 0.8,
                                                _screenSize.height * 0.01),
                                            primary: Colors.black),
                                        onPressed: () async {
                                          final url =
                                              'https://twitter.com/ishibashiya';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: RichText(
                                            text: TextSpan(children: [
                                          WidgetSpan(
                                              child: FaIcon(
                                            FontAwesomeIcons.twitter,
                                          )),
                                          TextSpan(text: "X(旧Twitter)"),
                                        ])),
                                      ),
                    
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(
                                                _screenSize.width * 0.8,
                                                _screenSize.height * 0.01),
                                            primary: Color.fromARGB(255, 99, 70, 185)),
                                        onPressed: () async {
                                          final url =
                                              'https://www.instagram.com/keyscafe.ishibashiya/';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: RichText(
                                            text: TextSpan(children: [
                                          WidgetSpan(
                                              child: FaIcon(
                                            FontAwesomeIcons.instagram,
                                          )),
                                          TextSpan(text: "Instagram"),
                                        ])),
                                      ),
                    
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ))));
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
