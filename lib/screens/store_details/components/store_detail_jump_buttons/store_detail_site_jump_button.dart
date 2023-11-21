import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_button.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SiteJumpButton extends ConsumerWidget {
  const SiteJumpButton({
    required this.storeWeb,
    super.key,
  });

  final String storeWeb;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buttonWidget;
    if (storeWeb.isNotEmpty) {
      buttonWidget = StoreDetailsJumpButton(
        backgroundColor: ColorName.orangeBase,
        onPressed: () async {
          final webUrl = Uri.parse(storeWeb);
          await launchUrl(webUrl);
        },
        iconWidget: const Icon(
          Icons.public,
        ),
        text: '公式ウェブサイト',
      );
    } else {
      buttonWidget = Container();
    }

    return buttonWidget;
  }
}
