import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/features/coupon/componet/coupon_list.dart';
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
            appBar: OriginalAppBar(),
            body: Center(
              child: Text('クーポンを所有していません'),
            ),
          );
        } else {
          return Scaffold(
            appBar: const OriginalAppBar(),
            body: ListView.builder(
              itemCount: data.couponList.length,
              itemBuilder: (context, index) {
                final controller = data.couponList[index];
                return FutureBuilder<bool>(
                  future: ref
                      .read(ownedCouponListViewModelProvider.notifier)
                      .checkExpiration(index),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
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
                );
              },
            ),
          );
        }
      },
    );
  }
}
