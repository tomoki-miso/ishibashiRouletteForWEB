import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/coupon/coupon/coupon.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:slide_to_act/slide_to_act.dart';

class UseCouponPage extends ConsumerWidget {
  const UseCouponPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> _key = GlobalKey();
                  return SlideAction(
                    height: 54,
                    alignment: Alignment.centerRight,
                    sliderButtonIcon: const Icon(Icons.chevron_right), //アイコンを設定
                    sliderRotate: false, //スワイプ時にアイコンを回転させない
                    animationDuration:
                        const Duration(milliseconds: 400), //アニメーションの長さ
                    text: 'スワイプしてクーポンをつかう',
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: ColorName.orangeBase,
                      fontWeight: FontWeight.bold,
                    ),
                    innerColor: ColorName.orangeBase,
                    outerColor: ColorName.orangeBase,
                    borderRadius: 10,
                    onSubmit: () async {
                      if (_key.currentState != null) {
                        const snackBar = SnackBar(
                          content: Text('クーポンを使用しました'),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        await _key.currentState!.reset();
                      } else {
                        const snackBar = SnackBar(
                          content: Text('クーポンを使用しました'),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CouponPage(),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ));
}
