import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class MapStoreInfoBusinessDaysPart extends StatelessWidget {
  const MapStoreInfoBusinessDaysPart(
      {required this.isVisibleDay,
      this.businessDays,
      this.remarksDay,
      super.key});

  final bool isVisibleDay;
  final List<String>? businessDays;
  final String? remarksDay;
  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(Icons.calendar_month),
          Column(
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
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList()
                      : [],
                )
              else
                const Text(
                  '営業日の情報がありません',
                  style: TextStyle(fontSize: 13),
                ),
              if (remarksDay != '')
                Text(
                  '※$remarksDay!',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ],
      );
}
