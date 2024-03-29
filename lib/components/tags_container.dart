import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';

class TagsContainerPart extends ConsumerWidget {
  const TagsContainerPart({
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
                ? formattedTags
                    .take(3)
                    .map(
                      (formattedTag) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 1,
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorName.whiteBase,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList()
                : [], // タグがない場合は空のリストを使用
          ),
        ],
      );
}
