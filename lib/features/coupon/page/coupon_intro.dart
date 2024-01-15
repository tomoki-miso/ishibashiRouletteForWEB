import 'package:flutter/material.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/features/coupon/components/coupon_intro_dl_buttons_part.dart';
import 'package:ishibashi/features/coupon/components/coupon_intro_icon_part.dart';
import 'package:ishibashi/features/coupon/components/coupon_intro_text_part.dart';

class CouponIntroPage extends StatelessWidget {
  const CouponIntroPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: OriginalAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(4)),

              /// テキスト部分
              CouponIntroTextPart(),

              ///　アプリアイコン
              CouponIntroIconPart(),
              SizedBox(height: 32),

              /// DLボタン
              CouponIntroDlButtonsPart(),
            ],
          ),
        ),
      );
}
