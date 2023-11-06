import 'package:flutter/material.dart';
import 'package:ishibashi/screens/search_confirm.dart';
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
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 30),
            child: IconButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchConfirmPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: ColorName.greyBase,
                  size: 60,
                )),
          )
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
