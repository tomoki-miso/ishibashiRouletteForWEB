import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/coupon/components/coupon_app_bar.dart';
import 'package:ishibashi/features/coupon/components/coupon_info_tile.dart';
import 'package:ishibashi/features/coupon/use_coupon/componets/slidebar_part.dart';
import 'package:ishibashi/features/coupon/use_coupon/view_model.dart';

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
        final couponData = data.coupon;
        return Scaffold(
          appBar: const CouponAppBar(
            withIcon: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// クーポン情報
                CouponInfo(
                  couponName: couponData.couponName,
                  storeName: couponData.storeName,
                  couponImage: couponData.couponImage,
                  detail: couponData.couponDetail,
                  expiration: couponData.expiration,
                  storeId: couponData.storeId,
                ),
                const SizedBox(height: 8),

                /// スライドバー
                SlideBarPart(couponId: couponId),
              ],
            ),
          ),
        );
      },
    );
  }
}
