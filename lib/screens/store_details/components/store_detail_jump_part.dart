import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/screens/store_details/components/store_details_jump_button.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreDetailJumpPart extends ConsumerWidget {
  const StoreDetailJumpPart({
    required this.storeWeb,
    required this.storeTabelog,
    required this.storeTwitter,
    required this.storeInsta,
    super.key,
  });

  final String storeWeb;
  final String storeTabelog;
  final String storeTwitter;
  final String storeInsta;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          //ウェブ
          if (storeWeb.isNotEmpty)
            StoreDetailsJumpButton(
              onPressed: () async {
                final webUrl = Uri.parse(storeWeb);
                await launchUrl(webUrl);
              },
              iconWidget: const Icon(
                Icons.public,
              ),
              text: '公式ウェブサイト',
            )
          else
            Container(),

          // タベログ
          if (storeTabelog.isNotEmpty)
            StoreDetailsJumpButton(
              onPressed: () async {
                final tabelogUrl = Uri.parse(storeTabelog);
                await launchUrl(tabelogUrl);
              },
              iconWidget: const Icon(
                Icons.public,
              ),
              text: '食べログ',
            )
          else
            Container(),

          // Twitter
          if (storeTwitter.isNotEmpty)
            StoreDetailsJumpButton(
              onPressed: () async {
                final xUrl = Uri.parse(storeTwitter);
                await launchUrl(xUrl);
              },
              iconWidget: const FaIcon(
                FontAwesomeIcons.twitter,
              ),
              text: 'X(旧Twitter)',
            )
          else
            Container(),

          // インスタ
          if (storeInsta.isNotEmpty)
            StoreDetailsJumpButton(
              onPressed: () async {
                final instaUrl = Uri.parse(storeInsta);
                await launchUrl(instaUrl);
              },
              iconWidget: const FaIcon(
                FontAwesomeIcons.instagram,
              ),
              text: 'Instagram',
            )
          else
            Container(), // URLがない場合、空のContainerを描画
        ],
      );
}
