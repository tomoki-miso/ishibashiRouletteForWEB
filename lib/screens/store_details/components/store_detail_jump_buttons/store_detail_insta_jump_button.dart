import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/screens/store_details/components/store_detail_jump_button.dart';
import 'package:url_launcher/url_launcher.dart';

class InstaJumpButton extends ConsumerWidget {
  const InstaJumpButton({
    required this.storeInsta,
    super.key,
  });

  final String storeInsta;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buttonWidget;
    if (storeInsta.isNotEmpty) {
      buttonWidget = StoreDetailsJumpButton(
        onPressed: () async {
          final xUrl = Uri.parse(storeInsta);
          await launchUrl(xUrl);
        },
        iconWidget: const FaIcon(
          FontAwesomeIcons.instagram,
        ),
        text: 'Instagram',
      );
    } else {
      buttonWidget = Container();
    }

    return buttonWidget;
  }
}
