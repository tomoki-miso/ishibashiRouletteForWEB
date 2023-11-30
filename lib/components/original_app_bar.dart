import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/features/search_confirm/page/search_confirm.dart';
import 'package:ishibashi/style/colors.dart';

class OriginalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OriginalAppBar({
    super.key,
    this.withIcon = true,
  });
  final bool withIcon;

  @override
  Widget build(BuildContext context) => AppBar(
        iconTheme: const IconThemeData(color: ColorName.greyBase),
        backgroundColor: Colors.white,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchConfirmPage(),
                ),
              );
            },
            icon: withIcon
                ? const FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: ColorName.greyBase,
                    size: 30,
                  )
                : const SizedBox(),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(43.5),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
