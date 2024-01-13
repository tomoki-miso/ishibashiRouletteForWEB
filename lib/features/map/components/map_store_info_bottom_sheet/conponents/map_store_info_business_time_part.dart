import 'package:flutter/material.dart';

class MapStoreInfoBussinessTimePart extends StatelessWidget {
  const MapStoreInfoBussinessTimePart({
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

  bool get isVisibleTime => openTime != '' && closeTime != '';
  bool get isVisibleTimeSecond => openTimeSecond != '' && closeTimeSecond != '';

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.schedule_outlined),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isVisibleTime)
                Text(
                  '$openTime～$closeTime',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                const Text(
                  '営業時間の情報がありません',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Visibility(
                visible: isVisibleTimeSecond,
                child: Text(
                  '$openTimeSecond～$closeTimeSecond',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (remarksTime != '')
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    '※$remarksTime',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
            ],
          ),
        ],
      );
}
