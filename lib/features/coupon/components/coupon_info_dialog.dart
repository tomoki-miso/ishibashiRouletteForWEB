import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_dialog.dart';
import 'package:ishibashi/style/colors.dart';

class CouponInfoDialog extends StatelessWidget {
  const CouponInfoDialog({
    this.couponName,
    this.storeName,
    this.detail,
    super.key,
  });

  final String? couponName;
  final String? storeName;
  final String? detail;

  @override
  Widget build(BuildContext context) => PrimaryDialog(
        title: couponName ?? '',
        contentWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '店名',
              style: TextStyle(color: ColorName.greyBase),
            ),
            const SizedBox(height: 8),
            Text(storeName ?? ''),
            const SizedBox(height: 12),
            const Text(
              '条件',
              style: TextStyle(color: ColorName.greyBase),
            ),
            const SizedBox(height: 8),
            if (detail == null || detail == '')
              const Text('条件が設定されていません。\nご使用の場合はお店の方に確認してください。')
            else
              Text(detail!),
          ],
        ),
      );
}
