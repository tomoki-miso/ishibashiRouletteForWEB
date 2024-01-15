import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class CouponIntroTextPart extends StatelessWidget {
  const CouponIntroTextPart({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text(
              'クーポンはアプリ版\n「石橋ごはんルーレット」のみの機能です。\nダウンロードしておトクに石橋のお店を楽しみましょう！',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorName.black2,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: const Text(
              '石橋ごはんルーレットについて→',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
        ],
      );
}
