import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/coupon/componet/coupon_info.dart';
import 'package:ishibashi/features/coupon/coupon/coupon.dart';
import 'package:ishibashi/features/coupon/use_coupon/view_model.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:slide_to_act/slide_to_act.dart';

class UseCouponPage extends ConsumerWidget {
  const UseCouponPage({
    required this.couponId,
    super.key,
  });

  final String couponId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(useCouponViewModelProvider(couponId));
    return state.when(
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        final controller = data.coupon;
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CouponInfo(
                  couponName: controller.couponName,
                  storeName: controller.storeName,
                  couponImage: controller.couponImage,
                  detail: controller.couponDetail,
                  expiration: controller.expiration,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Builder(
                    builder: (context) {
                      final GlobalKey<SlideActionState> _key = GlobalKey();
                      return SlideAction(
                        height: 54,
                        alignment: Alignment.centerRight,
                        sliderButtonIcon:
                            const Icon(Icons.chevron_right), //アイコンを設定
                        sliderRotate: false, //スワイプ時にアイコンを回転させない
                        animationDuration:
                            const Duration(milliseconds: 400), //アニメーションの長さ
                        text: 'スワイプしてクーポンをつかう',
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: ColorName.black2,
                          fontWeight: FontWeight.bold,
                        ),
                        innerColor: ColorName.backGroundYellow,
                        outerColor: ColorName.orangeBase,
                        borderRadius: 10,
                        onSubmit: () async {
                          if (_key.currentState != null) {
                            const snackBar = SnackBar(
                              content: Text('クーポンを使用しました'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            await _key.currentState!.reset();
                          } else {
                            await ref
                                .watch(
                                  useCouponViewModelProvider(couponId).notifier,
                                )
                                .useCoupon();
                            const snackBar = SnackBar(
                              content: Text('クーポンを使用しました'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
          ),
        );
      },
    );
  }
}
