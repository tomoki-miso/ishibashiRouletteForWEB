import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/coupon/components/coupon_app_bar.dart';
import 'package:ishibashi/features/coupon/owned_coupon_list/components/coupon_list.dart';
import 'package:ishibashi/features/coupon/owned_coupon_list/view_model.dart';

class OwnedCouponsPage extends ConsumerWidget {
  const OwnedCouponsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ownedCouponListViewModelProvider);

    return state.when(
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        if (data.couponList.isEmpty) {
          return const Scaffold(
            appBar: CouponAppBar(
              withIcon: false,
              title: '所有クーポン',
            ),
            body: Center(
              child: Text('クーポンを所有していません'),
            ),
          );
        } else {
          return Scaffold(
            appBar: const CouponAppBar(
              withIcon: false,
              title: '所有クーポン',
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Wrap(
                children: data.couponList
                    .map(
                      (controller) => FutureBuilder<bool>(
                        future: ref
                            .read(ownedCouponListViewModelProvider.notifier)
                            .checkExpiration(
                              data.couponList.indexOf(controller),
                            ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            final isAvailable = snapshot.data ?? false;
                            return CouponList(
                              isAvailable: isAvailable,
                              couponId: controller.couponId,
                              couponName: controller.couponName,
                              storeName: controller.storeName,
                              couponImage: controller.couponImage,
                              expiration: controller.expiration,
                            );
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
