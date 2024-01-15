import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RandomStoreTimePart extends ConsumerWidget {
  const RandomStoreTimePart({
    this.openTime,
    this.closeTime,
    this.openTimeSecond,
    this.closeTimeSecond,
    this.remarksTime,
    super.key,
  });

  final String? openTime;
  final String? closeTime;
  final String? openTimeSecond;
  final String? closeTimeSecond;
  final String? remarksTime;
  bool get isVisibleTime => closeTime != '' && openTime != '';
  bool get isVisibleTimeSecond => closeTimeSecond != '' || openTimeSecond != '';

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Column(
          children: [
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
                    style: Styles.businnesHours,
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
                      style: Styles.businnesHours,
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      );
}
