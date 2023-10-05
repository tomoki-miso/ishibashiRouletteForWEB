import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'googleforms.dart';

class InfoPage extends StatefulWidget {
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool connectionStatus = false; // Initialize it to false.

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          connectionStatus = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        connectionStatus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * 0.08),
        child: AppBar(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(screenSize.height * 0.02)),
            const Text("このアプリについて"),
            Container(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(padding: EdgeInsets.all(screenSize.height * 0.01)),
            const Text("お問い合わせ"),
            Container(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.03)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            screenSize.width * 0.8, screenSize.height * 0.06),
                        primary: Colors.black),
                    onPressed: () async {
                      final url = 'https://twitter.com/pochipochitudoi';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.twitter),
                        SizedBox(width: 8),
                        Text("X(旧Twitter)アカウント"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            screenSize.width * 0.8, screenSize.height * 0.06),
                        primary: const Color.fromARGB(124, 252, 0, 0)),
                    onPressed: connectionStatus
                        ? () async {
                            final String emailAddress =
                                'pochipochi.tudoi@gmail.com';
                            final String subject = 'お問い合わせ'; // 任意の件名を指定
                            final String emailLaunchUrl =
                                'mailto:${Uri.encodeComponent(emailAddress)}?subject=${Uri.encodeComponent(subject)}';

                            if (await canLaunch(emailLaunchUrl)) {
                              await launch(emailLaunchUrl);
                            } else {
                              throw 'Could not launch $emailLaunchUrl';
                            }
                          }
                        : null, // Disable the button if no internet connection
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.envelope),
                        SizedBox(width: 8),
                        Text("メールを送信"),
                      ],
                    ),
                  ),
                ],
              ),
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(padding: EdgeInsets.all(screenSize.height * 0.01)),
            const Text("ご意見"),
            Container(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(screenSize.height * 0.02)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(screenSize.width * 0.8,
                              screenSize.height * 0.06),
                          primary:  const Color.fromARGB(124, 252, 0, 0)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FormPage()),
                        );
                      },
                      child: const Text("お問い合わせフォーム")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
