import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/search/keyword_search/view_model.dart';

class KeywordSearchTextField extends ConsumerWidget {
  const KeywordSearchTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(keywordSearchViewModelProvider).requireValue;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 36,
      ),
      child: TextField(
        controller: data.searchWordController,
        style: const TextStyle(fontSize: 16),
        decoration: const InputDecoration(
          hintText: '店名、カテゴリーなどで検索',
        ),
        onChanged: (value) async {
          await ref
              .read(keywordSearchViewModelProvider.notifier)
              .searchKeyword(data.searchWordController.text.trim());
        },
      ),
    );
  }
}
