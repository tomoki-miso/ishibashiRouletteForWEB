import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class MapStoreInfoBusinessDaysPart extends StatelessWidget {
  const MapStoreInfoBusinessDaysPart({
    this.businessDays,
    this.remarksDay,
    super.key,
  });

  final List<String>? businessDays;
  final String? remarksDay;
  bool get isVisibleDay => businessDays!.isNotEmpty;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.calendar_month),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isVisibleDay)
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
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList()
                      : [],
                )
              else
                const Text(
                  '営業日の情報がありません',
                  style: TextStyle(fontSize: 14),
                ),
              if (remarksDay != '')
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    '※$remarksDay!',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                ),
            ],
          ),
        ],
      );
}
