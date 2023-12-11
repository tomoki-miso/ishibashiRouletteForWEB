import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/features/coupon/use_coupon/use_coupon.dart';
import 'package:ishibashi/style/colors.dart';

class CouponList extends StatelessWidget {
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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
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
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              color: ColorName.backGroundYellow,
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
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
                    ],
                  ),
                  Text(couponName ?? ''),
                  Text('有効期限:$expiration'),
                ],
              ),
            ),
          ),
        ),
      );
}
