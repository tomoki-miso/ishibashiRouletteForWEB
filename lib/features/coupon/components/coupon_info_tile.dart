import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_dialog.dart';
import 'package:ishibashi/features/coupon/components/coupon_info_dialog.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CouponInfo extends StatelessWidget {
  const CouponInfo({
    required this.couponName,
    required this.storeName,
    required this.couponImage,
    required this.detail,
    required this.expiration,
    required this.storeId,
    super.key,
  });

  final String? couponName;
  final String? storeName;
  final String? expiration;
  final String? couponImage;
  final String? detail;
  final String? storeId;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
                .copyWith(bottom: 8),
            decoration: BoxDecoration(
              color: ColorName.orangeSecondaryBase,
              border: Border.all(color: ColorName.greyBase, width: 5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  storeName ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(4)),
                CachedNetworkImage(
                  imageUrl: couponImage != ''
                      ? couponImage!
                      // : 'https://cdn.pixabay.com/photo/2015/06/24/13/31/beer-820011_1280.jpg', // TODO:クーポン用仮画像の用意
                      : 'https://user0514.cdnw.net/shared/img/thumb/miuFTHG2912_TP_V.jpg',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.cover,
                ),
                const Padding(padding: EdgeInsets.all(2)),
                Text(
                  couponName ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
                if (detail != '')
                  Text(
                    '条件：$detail' * 100,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      color: ColorName.black2,
                    ),
                  ),
                const SizedBox(height: 4),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            ColorName.greyBase,
                          ),
                        ),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => CouponInfoDialog(
                              couponName: couponName,
                              storeName: storeName,
                              detail: detail,
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.info,
                              size: 20,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'クーポンの詳細',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            ColorName.greyBase,
                          ),
                        ),
                        onPressed: () async {
                          if (storeId != null) {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoreDetailPage(
                                  documentId: storeId!,
                                ),
                              ),
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(),
                            );
                          }
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.info,
                              size: 20,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'お店を見る',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

class AlertDialog extends StatelessWidget {
  const AlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) => PrimaryDialog(
        title: 'お店の情報がありません',
        contentWidget: Column(
          children: [
            const Text(
              'お店の情報が登録されていないみたいです……\n修正いたしますのでお問い合わせいただけると幸いです。',
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  ColorName.brightRed,
                ),
              ),
              onPressed: () async {
                final webUrl = Uri.parse(
                  'https://docs.google.com/forms/d/e/1FAIpQLSefFYvzLlGMjzQigr-gleix11L-wSSJp-XT1u20SGFI3Gs_wA/viewform?usp=sf_link',
                );
                await launchUrl(webUrl);
              },
              child: const Text('問い合わせる'),
            ),
          ],
        ),
      );
}
