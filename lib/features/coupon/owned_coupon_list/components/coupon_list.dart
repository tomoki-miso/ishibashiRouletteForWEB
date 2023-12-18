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
  Widget build(BuildContext context, WidgetRef ref) => InkWell(
        borderRadius: BorderRadius.circular(20),
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
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.48,
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                color: ColorName.orangeSecondaryBase,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ColorName.greyBase,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.56,
                      width: MediaQuery.of(context).size.width * 0.48,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: couponImage ?? '', // TODO #28:仮画像
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    storeName ?? '',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: ColorName.black2,
                    ),
                  ),
                  Text(
                    couponName ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: ColorName.black2,
                    ),
                  ),
                  Text(
                    expiration ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: ColorName.black2,
                    ),
                  ),
                ],
              ),
            ),
            if (!isAvailable)
              Container(
                width: MediaQuery.of(context).size.width * 0.48,
                height: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color: ColorName.greySecondary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ColorName.greyBase,
                    width: 2,
                  ),
                ),
              ),
            if (!isAvailable)
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorName.backGroundYellow,
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
      );
}
