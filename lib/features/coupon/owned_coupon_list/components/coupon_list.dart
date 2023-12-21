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
  InkWell build(BuildContext context, WidgetRef ref) => InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () async {
          if (isAvailable) {
            await _navigateToUseCouponPage(context, couponId);
          } else {
            await _showDeleteAlertDialog(context, ref, couponId: couponId);
          }
        },
        onLongPress: () async {
          await _showDeleteAlertDialog(context, ref, couponId: couponId);
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
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
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: couponImage != ''
                              ? couponImage!
                              : 'https://user0514.cdnw.net/shared/img/thumb/miuFTHG2912_TP_V.jpg', // TODO #28:仮画像
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    storeName ?? '',
                    maxLines: 1,
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
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color: ColorName.greySecondary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ColorName.greyBase,
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '期限切れです',
                    style: TextStyle(
                      color: ColorName.whiteBase,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
}

Future<void> _navigateToUseCouponPage(
  BuildContext context,
  String couponId,
) async {
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UseCouponPage(couponId: couponId),
    ),
  );
}

Future<void> _showDeleteAlertDialog(
  BuildContext context,
  WidgetRef ref, {
  required String couponId,
}) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('クーポン削除'),
      content: const Text('このクーポンを削除してもよろしいですか？'),
      actions: [
        TextButton(
          child: const Text('キャンセル'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text(
            '削除',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            ref
                .read(ownedCouponListViewModelProvider.notifier)
                .deleteCoupon(couponId);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
