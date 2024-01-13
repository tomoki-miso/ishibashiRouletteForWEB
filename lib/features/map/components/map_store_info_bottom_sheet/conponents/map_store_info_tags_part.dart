import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class MapStoreInfoTagsPart extends StatelessWidget {
  const MapStoreInfoTagsPart({this.tags, super.key});
  final List<String>? tags;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tags!.isNotEmpty
            ? tags!
                .take(3)
                .map(
                  (formattedTag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                    margin: const EdgeInsets.all(1),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorName.randomRed,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        '#$formattedTag',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: ColorName.whiteBase,
                        ),
                      ),
                    ),
                  ),
                )
                .toList()
            : [], // タグがない場合は空のリストを使用
      );
}
