import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/search/business_day_search/page/business_day_search.dart';
import 'package:ishibashi/screens/search/business_day_search/view_model.dart';
import 'package:ishibashi/style/colors.dart';

class BusinessDaySearchSelectDays extends ConsumerWidget {
  const BusinessDaySearchSelectDays({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(businessDaySearchViewModelProvider).requireValue;

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorName.whiteBase,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          children: daysOfWeek.map((day) {
            final isSelected = data.selectedDays.contains(day);
            return InkWell(
              onTap: () async {
                await ref
                    .read(businessDaySearchViewModelProvider.notifier)
                    .handleDaySelection(day);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorName.brightRed,
                      width: 2,
                    ),
                    color: isSelected ? ColorName.brightRed : null,
                  ),
                  child: CircleAvatar(
                    backgroundColor:
                        isSelected ? ColorName.brightRed : ColorName.whiteBase,
                    child: Text(
                      day,
                      style: TextStyle(
                        color: isSelected ? Colors.white : ColorName.brightRed,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
