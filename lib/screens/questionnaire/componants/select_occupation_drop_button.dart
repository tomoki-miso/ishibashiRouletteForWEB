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
        items: data.dropDownGenderMap.entries.map((occupation) {
          final key = occupation.key;
          final value = occupation.value;
          return DropdownMenuItem(
            value: key,
            child: Text(value),
          );
        }).toList(),
        onChanged: (occupation) async {
          await ref
              .read(questionnaireViewModelProvider.notifier)
              .selectedOccupation(occupation);
        },
        value: data.selectedOccupation,
      ),
      error: (error, stackTrace) => Text('エラー'),
      loading: () => Text('loading'),
    );
  }
}
