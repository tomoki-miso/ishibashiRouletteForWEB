import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/coupon/coupon_display/view_model.dart';
import 'package:ishibashi/style/colors.dart';

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
        return Scaffold(
          appBar: const OriginalAppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: ColorName.backGroundYellow,
                    border: Border.all(color: ColorName.greyBase, width: 5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          Text(
                            couponData.storeName,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      CachedNetworkImage(
                        imageUrl: 'https://placehold.jp/150x150.png',
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.6,
                        fit: BoxFit.cover,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      Text(
                        couponData.couponName,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: ColorName.black2,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(1)),
                      const Wrap(
                        children: [
                          Text(
                            '有効期限：2023/11/30',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorName.black2,
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                          couponData.couponDetail,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: ColorName.black2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(4)),
                PrimaryButton(
                  onPressed: () {},
                  text: '保存する',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
