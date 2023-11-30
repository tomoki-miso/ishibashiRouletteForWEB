import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/questionnaire/selection.dart';
import 'package:ishibashi/screens/questionnaire/view_model.dart';

class SelectOccupationDropButton extends ConsumerWidget {
  const SelectOccupationDropButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => DropdownButton(
        items: dropDownOccupationMap.entries
            .map(
              (entry) => DropdownMenuItem(
                value: entry.key,
                child: Text(entry.value),
              ),
            )
            .toList(),
        value: data.selectedOccupation,
        onChanged: (occupation) async {
          await ref
              .read(questionnaireViewModelProvider.notifier)
              .selectOccupation(occupation);
        },
      ),
      error: (error, stackTrace) => const Text('エラー'),
      loading: () => const Text('loading'),
    );
  }
}
