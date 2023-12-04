import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/screens/coupon/page/owned_coupons.dart';
import 'package:ishibashi/style/colors.dart';

class CouponAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CouponAppbar({super.key});

  @override
  Widget build(BuildContext context) => OriginalAppBar(
        isCustomAction: true,
        customAction: IconButton(
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
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
