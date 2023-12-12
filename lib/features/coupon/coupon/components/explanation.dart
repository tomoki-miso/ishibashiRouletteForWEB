import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class CouponExplanation extends StatelessWidget {
  const CouponExplanation({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: const Text(
          'クーポンガチャは1日1回必ず挑戦できます。キャンペーンに参加することでさらにたくさん挑戦できるチャンスも⁉',
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorName.greyBase),
        ),
      );
}
