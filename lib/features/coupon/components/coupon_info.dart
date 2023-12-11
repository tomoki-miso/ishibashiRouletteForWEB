import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class CouponInfo extends StatelessWidget {
  const CouponInfo({
    required this.couponName,
    required this.storeName,
    required this.couponImage,
    required this.detail,
    required this.expiration,
    super.key,
  });

  final String? couponName;
  final String? storeName;
  final String? expiration;
  final String? couponImage;
  final String? detail;

  @override
  Widget build(BuildContext context) => Container(
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
                  storeName ?? '',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(2)),
            CachedNetworkImage(
              imageUrl: couponImage ?? '', // TODO:クーポン用仮画像の用意
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.cover,
            ),
            const Padding(padding: EdgeInsets.all(2)),
            Text(
              couponName ?? '',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorName.black2,
              ),
            ),
            const Padding(padding: EdgeInsets.all(1)),
            Wrap(
              children: [
                Text(
                  '有効期限:$expiration',
                  style: const TextStyle(
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
                '条件：$detail' * 10,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorName.black2,
                ),
              ),
            ),
          ],
        ),
      );
}
