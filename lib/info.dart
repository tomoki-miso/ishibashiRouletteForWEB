import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(_screenSize.height * 0.02)),
            Text("このアプリについて"),
            Container(
              width: _screenSize.width * 0.9,
              height: _screenSize.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(padding: EdgeInsets.all(_screenSize.height * 0.01)),
            Text("お問い合わせ"),
            Container(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: _screenSize.height*0.03)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(_screenSize.width*0.8, _screenSize.height*0.01),primary: Colors.black),
                    onPressed: () async {
                      final url = 'https://twitter.com/pochipochitudoi';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: 
                    RichText(text: TextSpan(
                      children: [
                        WidgetSpan(child: FaIcon(
                          FontAwesomeIcons.twitter,)
                        ),
                        TextSpan(
                          text: "X(旧Twitter)アカウント"
                        ),
                      ]
                    )),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(_screenSize.width*0.8, _screenSize.height*0.01),primary: Color.fromARGB(124, 252, 0, 0)),
                    onPressed: () async {
                      final String emailAddress = 'pochipochi.tudoi@gmail.com';
                      final String subject = 'お問い合わせ'; // 任意の件名を指定
                      final String emailLaunchUrl =
                          'mailto:${Uri.encodeComponent(emailAddress)}?subject=${Uri.encodeComponent(subject)}';

                      if (await canLaunch(emailLaunchUrl)) {
                        await launch(emailLaunchUrl);
                      } else {
                        throw 'Could not launch $emailLaunchUrl';
                      }
                    },
                    //メールは実機検証が必要　のむら
                    child: RichText(text: TextSpan(
                      children: [
                        WidgetSpan(child: FaIcon(
                          FontAwesomeIcons.envelope,)
                        ),
                        TextSpan(
                          text: "メールを送信"
                        ),
                      ]
                    )),
                  ),
                ],
              ),
              width: _screenSize.width * 0.9,
              height: _screenSize.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(padding: EdgeInsets.all(_screenSize.height * 0.01)),
            Text("ご意見"),
          ],
        ),
      ),
    );
  }
}
