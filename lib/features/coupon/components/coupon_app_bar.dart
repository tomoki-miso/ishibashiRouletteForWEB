import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/features/coupon/owned_coupon_list/owned_coupons.dart';
import 'package:ishibashi/style/colors.dart';

class CouponAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CouponAppBar({
    super.key,
    this.withIcon = true,
    this.title,
  });

  final bool withIcon;
  final String? title;

  @override
  Widget build(BuildContext context) => AppBar(
        iconTheme: const IconThemeData(color: ColorName.greyBase),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title ?? '',
          style: const TextStyle(color: ColorName.greyBase, fontSize: 14),
        ),
        actions: [
          if (withIcon)
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OwnedCouponsPage(),
                  ),
                );
              },
              icon: const FaIcon(
                FontAwesomeIcons.ticket,
                color: ColorName.greyBase,
                size: 30,
              ),
            )
          else
            const SizedBox(),
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
