import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CouponIntroDlButtonsPart extends StatelessWidget {
  const CouponIntroDlButtonsPart({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// GooglePlayStore
          GestureDetector(
            onTap: () async {
              final url = Uri.parse(
                'https://play.google.com/store/apps/details?id=com.potipoti.ishibashi',
              );
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                // ignore: avoid_print
                print("Can't launch $url");
              }
            },
            child: Image.asset(
              'assets/images/google-play-badge.png',
              height: 64,
            ),
          ),
          const SizedBox(width: 24),

          /// AppStore
          GestureDetector(
            onTap: () async {
              final url = Uri.parse(
                'https://apps.apple.com/jp/app/%E7%9F%B3%E6%A9%8B%E3%81%94%E3%81%AF%E3%82%93%E3%83%AB%E3%83%BC%E3%83%AC%E3%83%83%E3%83%88/id6469585028',
              );
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                // ignore: avoid_print
                print("Can't launch $url");
              }
            },
            child: WebsafeSvg.asset(
              'assets/images/dl_app_store.svg',
              height: 50,
            ),
          ),
        ],
      );
}
