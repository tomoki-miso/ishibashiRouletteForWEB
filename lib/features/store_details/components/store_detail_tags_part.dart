import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';

class StoreDetailTagsPart extends ConsumerWidget {
  const StoreDetailTagsPart({
    required this.formattedTags,
    super.key,
  });

  final List<String> formattedTags;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: formattedTags.isNotEmpty
                ? formattedTags.take(3).map((formattedTag) {
                    final isLastTag = formattedTag == formattedTags.last;
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1,
                      ),
                      margin: const EdgeInsets.all(1),
                      child: Text(
                        '#$formattedTag${isLastTag ? '' : ','}',
                        style: const TextStyle(
                          color: ColorName.black2,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList()
                : [], // タグがない場合は空のリストを使用
          ),
        ],
      );
}