import 'package:flutter/material.dart';

class CouponIntroIconPart extends StatelessWidget {
  const CouponIntroIconPart({super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/icon.png',
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      );
}
