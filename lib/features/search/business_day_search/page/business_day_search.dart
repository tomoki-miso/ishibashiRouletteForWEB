import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/features/search/business_day_search/components/business_day_search_result_list.dart';
import 'package:ishibashi/features/search/business_day_search/components/business_day_search_select_days.dart';
import 'package:ishibashi/features/search/business_day_search/view_model.dart';
import 'package:ishibashi/style/colors.dart';

final daysOfWeek = [
  '月',
  '火',
  '水',
  '木',
  '金',
  '土',
  '日',
];

class BusinessDaySearchPage extends ConsumerWidget {
  const BusinessDaySearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(businessDaySearchViewModelProvider);
    return state.when(
      data: (data) => const Scaffold(
        backgroundColor: ColorName.backGroundYellow,
        appBar: OriginalAppBar(withIcon: false),
        body: Column(
          children: [
            BusinessDaySearchSelectDays(),
            BusinessDaySearchResultList(),
          ],
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
