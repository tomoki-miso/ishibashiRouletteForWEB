import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) => AppBar(
        iconTheme: const IconThemeData(color: ColorName.greyBase, size: 40),
        backgroundColor: Colors.white,
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(43.5),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
