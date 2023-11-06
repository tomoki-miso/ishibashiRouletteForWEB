import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/style/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TopDrawerInquiryPage extends StatefulWidget {
  TopDrawerInquiryPage({super.key});

  @override
  State<TopDrawerInquiryPage> createState() => _TopDrawerInquiryState();
}

class _TopDrawerInquiryState extends State<TopDrawerInquiryPage> {
  bool connectionStatus = false;

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
  Widget build(BuildContext context) => Scaffold(
        appBar: const OriginalAppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
                const Text(
                  'お問い合わせ',
                  style: Styles.storeNameStyle,
                ),
                const Padding(padding: EdgeInsets.all(8)),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.8,
                            MediaQuery.of(context).size.height * 0.06,
                          ),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          const url = 'https://twitter.com/pochipochitudoi';
                          if (await canLaunchUrl(url as Uri)) {
                            await launchUrlString(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.twitter),
                            SizedBox(width: 8),
                            Text('X(旧Twitter)アカウント'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.8,
                            MediaQuery.of(context).size.height * 0.06,
                          ),
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                        onPressed: connectionStatus
                            ? () async {
                                const String emailAddress =
                                    'pochipochi.tudoi@gmail.com';
                                const String subject = 'お問い合わせ'; // 任意の件名を指定
                                final String emailLaunchUrl =
                                    'mailto:${Uri.encodeComponent(emailAddress)}?subject=${Uri.encodeComponent(subject)}';

                                if (await canLaunchUrl(emailLaunchUrl as Uri)) {
                                  await launchUrlString(emailLaunchUrl);
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
                            Text('メールを送信'),
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
