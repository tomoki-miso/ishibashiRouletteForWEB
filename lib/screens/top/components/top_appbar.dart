import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => AppBar(
        iconTheme: const IconThemeData(color: ColorName.greyBase, size: 40),
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
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(43.5),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
