import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/loading.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/features/coupon/components/coupon_info_tile.dart';
import 'package:ishibashi/features/coupon/coupon_display/components/save_coupon_button.dart';
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
            PopScope(
              canPop: false,
              child: Scaffold(
                appBar: const OriginalAppBar(
                  withIcon: false,
                  automaticallyImplyLeading: false,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// クーポンの情報
                      CouponInfo(
                        couponName: couponData.couponName,
                        storeName: couponData.couponName,
                        couponImage: couponData.couponImage,
                        detail: couponData.couponDetail,
                        expiration: couponData.expiration,
                        storeId: couponData.storeId,
                      ),
                      const Padding(padding: EdgeInsets.all(4)),

                      /// ボタン
                      SaveCouponButton(
                        couponId: couponId,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (data.isLoading) const Loading(),
          ],
        );
      },
    );
  }
}
