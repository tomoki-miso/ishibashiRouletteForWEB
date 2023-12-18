import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
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
            appBar: OriginalAppBar(),
            body: Center(
              child: Text('クーポンを所有していません'),
            ),
          );
        } else {
          return Scaffold(
            appBar: const OriginalAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: data.couponList
                      .map(
                        (controller) => FutureBuilder<bool>(
                          future: ref
                              .read(ownedCouponListViewModelProvider.notifier)
                              .checkExpiration(
                                  data.couponList.indexOf(controller)),
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
            ),
          );
        }
      },
    );
  }
}
