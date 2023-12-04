import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_button.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TabelogJumpButton extends ConsumerWidget {
  const TabelogJumpButton({
    required this.storeTabelog,
    super.key,
  });

  final String storeTabelog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buttonWidget;
    if (storeTabelog.isNotEmpty) {
      buttonWidget = StoreDetailsJumpButton(
        backgroundColor: ColorName.tabelogRed,
        onPressed: () async {
          final webUrl = Uri.parse(storeTabelog);
          await launchUrl(webUrl);
        },
        iconWidget: const Icon(
          Icons.public,
        ),
        text: '食べログ',
      );
    } else {
      buttonWidget = Container();
    }

    return buttonWidget;
  }
}
