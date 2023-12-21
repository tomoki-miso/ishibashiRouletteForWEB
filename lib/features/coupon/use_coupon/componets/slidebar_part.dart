import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/coupon/use_coupon/view_model.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideBarPart extends ConsumerWidget {
  const SlideBarPart({
    required this.couponId,
    super.key,
  });

  final String couponId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Builder(
          builder: (context) => SlideAction(
            height: 54,
            alignment: Alignment.centerRight,
            sliderButtonIcon: const Icon(Icons.chevron_right), //アイコンを設定
            sliderRotate: false, //スワイプ時にアイコンを回転させない
            animationDuration: const Duration(milliseconds: 400), //アニメーションの長さ
            text: 'スワイプしてクーポンをつかう',
            textStyle: const TextStyle(
              fontSize: 12,
              color: ColorName.black2,
              fontWeight: FontWeight.bold,
            ),
            innerColor: ColorName.orangeBase,
            outerColor: ColorName.backGroundYellow,
            borderRadius: 10,
            onSubmit: () async {
              await ref
                  .watch(
                    useCouponViewModelProvider(couponId).notifier,
                  )
                  .useCoupon()
                  .then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('クーポンを使用しました。'),
                        duration: Duration(seconds: 2),
                      ),
                    ),
                  )
                  .then((value) => Navigator.pop(context))
                  .then((value) => Navigator.pop(context));
            },
          ),
        ),
      );
}
