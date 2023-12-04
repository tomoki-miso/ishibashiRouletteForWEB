import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StoreDetailStoreDayTimePart extends ConsumerWidget {
  const StoreDetailStoreDayTimePart({
    this.businessDays,
    this.openTime,
    this.closeTime,
    this.openTimeSecond,
    this.closeTimeSecond,
    this.remarksTime,
    this.remarksDay,
    super.key,
  });

  final List<String>? businessDays;
  final String? openTime;
  final String? closeTime;
  final String? openTimeSecond;
  final String? closeTimeSecond;
  final String? remarksDay;
  final String? remarksTime;
  bool get isVisibleTime => closeTime != '' && openTime != '';
  bool get isVisibleTimeSecond => closeTimeSecond != '' || openTimeSecond != '';

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          /// 営業日
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: ColorName.brightRed,
              ),
              Wrap(
                spacing: 1,
                runSpacing: 1,
                children: businessDays!.isNotEmpty
                    ? businessDays!.map((formattedBusinessDays) {
                        final isLastDay =
                            formattedBusinessDays == businessDays!.last;
                        return Text(
                          '$formattedBusinessDays${isLastDay ? '' : ','}',
                          style: const TextStyle(
                            color: ColorName.black2,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList()
                    : [],
              ),
            ],
          ),

          /// 営業日備考
          if (remarksDay != '')
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                '※$remarksDay',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          const SizedBox(height: 12),

          /// 営業時間
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.storeClockOutline,
                color: ColorName.brightRed,
              ),
              if (isVisibleTime)
                Text(
                  '$openTime〜$closeTime',
                  style: Styles.detailBusinnesHours,
                )
              else
                const Text(
                  '営業時間の情報がありません',
                  style: Styles.businnesHours,
                ),
              Visibility(
                visible: isVisibleTimeSecond,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '$openTimeSecond〜$closeTimeSecond',
                    style: Styles.detailBusinnesHours,
                  ),
                ),
              ),
            ],
          ),

          ///　時間備考
          if (remarksTime != '')
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                '※$remarksTime',
                style: const TextStyle(fontSize: 14),
              ),
            ),
        ],
      );
}
