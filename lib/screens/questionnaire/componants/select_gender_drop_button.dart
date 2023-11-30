import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/questionnaire/selection.dart';
import 'package:ishibashi/screens/questionnaire/view_model.dart';

class SelectGenderDropButton extends ConsumerWidget {
  const SelectGenderDropButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => DropdownButton(
        items: dropDownGenderMap.entries
            .map(
              (entry) => DropdownMenuItem(
                value: entry.key,
                child: Text(entry.value),
              ),
            )
            .toList(),
        value: data.selectedGender,
        onChanged: (gender) async {
          await ref
              .read(questionnaireViewModelProvider.notifier)
              .selectGender(gender);
        },
      ),
      error: (error, stackTrace) => const Text('エラー'),
      loading: () => const Text('loading'),
    );
  }
}
