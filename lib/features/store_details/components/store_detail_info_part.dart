import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/store_details/components/store_detail_detail_text_part.dart';

class StoreDetailInfoPart extends ConsumerWidget {
  const StoreDetailInfoPart({
    required this.formattedTags,
    required this.storeDetail,
    super.key,
  });

  final List<String> formattedTags;
  final String storeDetail;
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList()
                : [], // タグがない場合は空のリストを使用
          ),
          StoreDetailTextPart(storeDetail: storeDetail),
        ],
      );
}
