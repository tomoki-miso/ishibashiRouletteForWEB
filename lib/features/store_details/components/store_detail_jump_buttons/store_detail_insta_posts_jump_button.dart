import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/features/store_details/components/store_detail_jump_button.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class InstaJumpPostsButton extends ConsumerWidget {
  const InstaJumpPostsButton({
    required this.storeInstaPosts,
    super.key,
  });

  final String storeInstaPosts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buttonWidget;
    if (storeInstaPosts.isNotEmpty) {
      buttonWidget = StoreDetailsJumpButton(
        backgroundColor: ColorName.instaPink,
        onPressed: () async {
          final xUrl = Uri.parse(storeInstaPosts);
          await launchUrl(xUrl);
        },
        iconWidget: const FaIcon(
          FontAwesomeIcons.instagram,
        ),
        text: 'Instagramで投稿をみる',
      );
    } else {
      buttonWidget = Container();
    }

    return buttonWidget;
  }
}
