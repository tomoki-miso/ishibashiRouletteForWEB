import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/coupon/owned_coupon_list/view_model.dart';
import 'package:ishibashi/features/coupon/use_coupon/use_coupon.dart';
import 'package:ishibashi/style/colors.dart';

class CouponList extends ConsumerWidget {
  const CouponList({
    required this.couponId,
    required this.couponName,
    required this.storeName,
    required this.couponImage,
    required this.expiration,
    required this.isAvailable,
    super.key,
  });

  final String couponId;
  final String? couponName;
  final String? storeName;
  final String? expiration;
  final String? couponImage;
  final bool isAvailable;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: InkWell(
          onTap: isAvailable
              ? () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UseCouponPage(couponId: couponId),
                    ),
                  );
                }
              : null,
          child: Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    color: ColorName.backGroundYellow,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: CachedNetworkImage(
                          imageUrl: couponImage ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          storeName ?? '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: ColorName.black2,
                          ),
                        ),
                      ),
                      Text(couponName ?? ''),
                      Text('有効期限:$expiration'),
                    ],
                  ),
                ),
                if (!isAvailable)
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorName.orangeBase,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () async {
                        await ref
                            .read(ownedCouponListViewModelProvider.notifier)
                            .deleteCoupon(couponId);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: ColorName.whiteBase,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
