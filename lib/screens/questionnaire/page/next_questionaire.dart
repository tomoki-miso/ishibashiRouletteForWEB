import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/screens/questionnaire/view_model.dart';

class NextQuestionnairePage extends ConsumerWidget {
  const NextQuestionnairePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => Scaffold(
        body: Column(
          children: [
            const Text('ユーザーネーム'),
            DropdownButton(
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
            DropdownButton(
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
            PrimaryButton(
              onPressed: () async {
                if (data.selectedOccupation != '阪大生') {
                  await _navigateToBasePage(context);
                } else {
                  await _navigateToNextQuestionanairePage(context);
                }
              },
              text: '次へ進む',
            )
          ],
        ),
      ),
      error: (error, stackTrace) => const Text('error'),
      loading: () => const Text('loading'),
    );
  }
}

Future<void> _navigateToBasePage(BuildContext context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BasePage()),
  );
}

Future<void> _navigateToNextQuestionanairePage(BuildContext context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BasePage()),
  );
}
