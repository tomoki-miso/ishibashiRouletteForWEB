import 'package:flutter/material.dart';

class MapStoreInfoBussinessTimePart extends StatelessWidget {
  const MapStoreInfoBussinessTimePart(
      {required this.isVisibleTime,
      required this.isVisibleTimeSecond,
      this.openTime,
      this.closeTime,
      this.openTimeSecond,
      this.closeTimeSecond,
      this.remarksTime,
      super.key});

  final bool isVisibleTime;
  final bool isVisibleTimeSecond;
  final String? openTime;
  final String? closeTime;
  final String? openTimeSecond;
  final String? closeTimeSecond;
  final String? remarksTime;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(Icons.schedule_outlined),
      Column(
            children: [
              if (isVisibleTime)
                Column(
                  children: [
                    Text('$openTime～$closeTime',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      closeTime!,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              else
                const Text(
                  '営業時間の情報がありません',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Visibility(
                visible: isVisibleTimeSecond,
                child: Column(
                  children: [
                    Text(
                      '$openTimeSecond～$closeTimeSecond',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (remarksTime != '') Text('※$remarksTime',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),),
            ],
          ),
    ],
  );
}
