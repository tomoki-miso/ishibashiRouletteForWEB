import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/questionnaire/view_model.dart';

class SelectGenderDropButton extends ConsumerWidget {
  const SelectGenderDropButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => DropdownButton(
        items: data.dropDownGenderMap.entries.map((gender) {
          final key = gender.key;
          final value = gender.value;
          return DropdownMenuItem(
            value: key,
            child: Text(value),
          );
        }).toList(),
        value: data.selectedGender,
        onChanged: (gender) async {
          await ref
              .read(questionnaireViewModelProvider.notifier)
              .selectGender(gender);
        },
      ),
      error: (error, stackTrace) => Text('エラー'),
      loading: () => Text('loading'),
    );
  }
}
