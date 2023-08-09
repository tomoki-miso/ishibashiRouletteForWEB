import 'dart:ui';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; //横幅
    final height = MediaQuery.of(context).size.height; //高さ

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.05),
        child: AppBar(
          backgroundColor: Colors.white70,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      body: Center(
          child: Container(
        width: width,
        height: height,
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), // 角を丸くする
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(6),
                width: width * 0.9,
                height: height * 0.6,
                child: Column(
                  children: [
                    Text(
                      "いしばしや＆KEY'S CAFE 石橋駅前店", // 表示するテキスト
                      style: TextStyle(
                        fontSize: 20, // フォントサイズ
                        fontWeight: FontWeight.bold, // フォントの太さ
                        color: Colors.black54, // テキストの色
                      ),
                    ),
                    Row(
                      children: [
                        LikeButton(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0), // 角を丸くする
                            color: Colors.deepOrangeAccent,
                          ),
                          margin: EdgeInsets.all(2.0),
                          width: 80,
                          child: Center(
                            child: Text(
                              '#カフェ',
                              style: TextStyle(
                                fontSize: 18, // フォントサイズ
                                color: Colors.white, // テキストの色
                              ),
                            ),
                          ),
                        ), //タグ
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0), // 角を丸くする
                            color: Colors.deepOrangeAccent,
                          ),
                          margin: EdgeInsets.all(2.0),
                          width: 80,
                          child: Center(
                            child: Text(
                              '#喫茶店',
                              style: TextStyle(
                                fontSize: 18, // フォントサイズ
                                color: Colors.white, // テキストの色
                              ),
                            ),
                          ),
                        ), //タグ
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0), // 角を丸くする
                            color: Colors.deepOrangeAccent,
                          ),
                          margin: EdgeInsets.all(2.0),
                          width: 80,
                          child: Center(
                            child: Text(
                              '#猫',
                              style: TextStyle(
                                fontSize: 18, // フォントサイズ
                                color: Colors.white, // テキストの色
                              ),
                            ),
                          ),
                        ), //タグ
                      ], //タグのある列のグループ
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5), // 角の丸みを指定
                        child: Image.network(
                          'https://www.ss-ishibashi.jp/wp-content/uploads/2014/03/f260a701c32672bf1b5b2899adf3a9fe-600x450.jpg', // 画像のURL
                          width: width * 0.8, // 幅
                          fit: BoxFit.cover, // 画像の表示方法を指定
                        ),
                      ),
                    ),
                    //Container(
                      //padding: EdgeInsets.all(10),
                      //child: Text(
                         // '石橋駅を降りてスグ！！なつかしい町、石橋。ふれあいの街、石橋商店街。小物達との出会いの”いしばしや”。豊富な品揃えで何でもそろう下町のセレクトショップです。駅前の待ち合わせや雨宿りにもご利用くださいませ。'),
                    //)
                  ], //白いボックスの中身
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                width: width * 0.7,
                child: OutlinedButton(
                  onPressed: () {
                    /* ボタンが押せる時 */
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent, // 背景色

                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18), // パディング
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 角の丸み
                    ),
                    side: BorderSide(color: Colors.black87), // 枠線の色
                  ),
                  child: Text(
                    'お店を探す',
                    style: TextStyle(
                      fontSize: 22, // フォントサイズ
                      color: Colors.black87, // テキストの色（上記の primary と同じ）
                    ),
                  ),
                ),
              )
            ], //白いボックスの中
          ),
        ),
      )),
    );
  }
}

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false; // いいねの状態を管理する変数

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
