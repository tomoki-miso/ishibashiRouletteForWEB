import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/coupon/componet/coupon_info.dart';
import 'package:ishibashi/features/coupon/coupon_display/view_model.dart';

class CouponDisplayPage extends ConsumerWidget {
  const CouponDisplayPage({
    required this.couponId,
    super.key,
  });

  final String couponId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CouponDisplayViewModelProvider(couponId));

    return state.when(
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        final couponData = data.coupon;
        return Stack(
          children: [
            WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                appBar: const OriginalAppBar(
                  withIcon: false,
                  automaticallyImplyLeading: false,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CouponInfo(
                        couponName: couponData.couponName,
                        storeName: couponData.couponName,
                        couponImage: couponData.couponImage,
                        detail: couponData.couponDetail,
                        expiration: couponData.expiration,
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      PrimaryButton(
                        onPressed: () async {
                          await ref
                              .read(
                                couponDisplayViewModelProvider(couponId)
                                    .notifier,
                              )
                              .saveCoupon()
                              .then(
                                (value) => Navigator.pop(context),
                              );
                        },
                        text: '保存する',
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (data.isLoading)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        );
      },
    );
  }
}
