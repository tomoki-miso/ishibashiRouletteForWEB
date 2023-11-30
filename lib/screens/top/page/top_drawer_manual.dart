import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/style/styles.dart';

class TopDrawerManualPage extends StatelessWidget {
  const TopDrawerManualPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const OriginalAppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
                const Text(
                  'アプリの使い方',
                  style: Styles.storeNameStyle,
                ),
                const Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.list,
                              size: 70,
                              color: Colors.deepOrangeAccent,
                            ),
                            Padding(padding: EdgeInsets.all(13)),
                            Flexible(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '取り扱っている石橋の飲食店のリストです！\nそれぞれのお店をタップすると詳しい情報をみることができます。\n左上の ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.search,
                                        size: 12,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'から「営業日検索」や「キーワード検索」でお店を探すことが出来るよ。',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.width * 0.03,
                        thickness: 0.8,
                        indent: 0,
                        endIndent: 0,
                        color: const Color.fromRGBO(128, 125, 125, 0.525),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 13, bottom: 13),
                        child: const Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.shop,
                              size: 60,
                              color: Colors.deepOrangeAccent,
                            ),
                            Padding(padding: EdgeInsets.all(12)),
                            Flexible(
                              child: Text(
                                'お店をランダムに表示します！\n「今日どこでご飯食べようかな…」というときに知らなかったお店と出会うチャンス！',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.width * 0.03,
                        thickness: 0.8,
                        indent: 0,
                        endIndent: 0,
                        color: const Color.fromRGBO(128, 125, 125, 0.525),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 13),
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.mapLocationDot,
                              size: 60,
                              color: Colors.deepOrangeAccent,
                            ),
                            const Padding(padding: EdgeInsets.all(12)),
                            const Flexible(
                              child: Text(
                                'あなたの現在地と、お店の場所がまるわかり！\n近くのお店に行っても良し！行ったことのないお店に行っても良し！',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
