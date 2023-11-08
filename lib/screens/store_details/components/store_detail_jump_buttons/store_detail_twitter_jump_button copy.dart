import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_button.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterJumpButton extends ConsumerWidget {
  const TwitterJumpButton({
    required this.storeTwitter,
    super.key,
  });

  final String storeTwitter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buttonWidget;
    if (storeTwitter.isNotEmpty) {
      buttonWidget = StoreDetailsJumpButton(
        onPressed: () async {
          final xUrl = Uri.parse(storeTwitter);
          await launchUrl(xUrl);
        },
        iconWidget: const FaIcon(
          FontAwesomeIcons.twitter,
        ),
        text: 'X(旧Twitter)',
      );
    } else {
      buttonWidget = Container();
    }

    return buttonWidget;
  }
}
