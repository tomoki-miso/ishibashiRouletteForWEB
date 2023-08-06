import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Information")),
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
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(padding: EdgeInsets.all(_screenSize.height * 0.01)),
            Text("お問い合わせ"),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final url = 'https://twitter.com/pochipochitudoi';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text("Twitter"),
                  ),
                  ElevatedButton(
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
                    child: Text("メール"),
                  ),
                ],
              ),
              width: _screenSize.width * 0.9,
              height: _screenSize.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.red,
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
