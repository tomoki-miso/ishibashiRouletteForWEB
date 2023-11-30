import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/questionnaire/selection.dart';
import 'package:ishibashi/features/questionnaire/view_model.dart';

class SelectFacultyDropButton extends ConsumerWidget {
  const SelectFacultyDropButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => DropdownButton(
        items: dropDownFacultyMap.entries
            .map(
              (entry) => DropdownMenuItem(
                value: entry.key,
                child: Text(entry.value),
              ),
            )
            .toList(),
        value: data.selectedFaculty,
        onChanged: (faculty) async {
          await ref
              .read(questionnaireViewModelProvider.notifier)
              .selectFaculty(faculty);
        },
      ),
      error: (error, stackTrace) => const Text('エラー'),
      loading: () => const Text('loading'),
    );
  }
}