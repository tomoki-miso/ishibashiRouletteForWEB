import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/screens/search_confirm/page/search_confirm.dart';
import 'package:ishibashi/style/colors.dart';

class OriginalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OriginalAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => AppBar(
      iconTheme: const IconThemeData(color: ColorName.greyBase),
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13, bottom: 14),
            child: SizedBox(
              height: 60,
              child: Image.asset('assets/images/iconKari.png'),
            ),
          ),
          IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchConfirmPage(),
                  ),
                );
              },
              icon: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: ColorName.greyBase,
                size: 30,
              ))
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(43.5),
        ),
      ));

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
