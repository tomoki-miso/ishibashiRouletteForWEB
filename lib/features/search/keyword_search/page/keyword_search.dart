import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/features/search/keyword_search/components/keyword_search_result_list.dart';
import 'package:ishibashi/features/search/keyword_search/components/keyword_search_text_field.dart';
import 'package:ishibashi/features/search/keyword_search/view_model.dart';

class KeywordSearchPage extends ConsumerWidget {
  const KeywordSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(keywordSearchViewModelProvider);

    return state.when(
      data: (data) => const Scaffold(
        appBar: OriginalAppBar(
          withIcon: false,
        ),
        body: Column(
          children: [
            KeywordSearchTextField(),
            KeywordSearchResultList(),
          ],
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
