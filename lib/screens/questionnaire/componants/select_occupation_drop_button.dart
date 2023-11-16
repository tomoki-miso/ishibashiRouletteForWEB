import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/questionnaire/view_model.dart';

class SelectOccupationDropButton extends ConsumerWidget {
  const SelectOccupationDropButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => DropdownButton(
        items: data.dropDownOccupationMap.entries
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
          print(occupation);
        },
      ),
      error: (error, stackTrace) => Text('エラー'),
      loading: () => Text('loading'),
    );
  }
}
