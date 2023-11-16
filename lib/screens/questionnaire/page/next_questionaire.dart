import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/screens/questionnaire/componants/select_occupation_drop_button.dart';
import 'package:ishibashi/screens/questionnaire/view_model.dart';

class NextQuestionnairePage extends ConsumerWidget {
  const NextQuestionnairePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            SelectOccupationDropButton(),
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
