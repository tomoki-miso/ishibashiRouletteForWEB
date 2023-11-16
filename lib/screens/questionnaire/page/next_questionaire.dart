import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/screens/questionnaire/componants/select_faculty_drop_button.dart';
import 'package:ishibashi/screens/questionnaire/view_model.dart';

class NextQuestionnairePage extends ConsumerWidget {
  const NextQuestionnairePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.all(50)),
              const Text(
                '学部を選択してください',
                style: TextStyle(fontSize: 20),
              ),
              
              const Padding(padding: EdgeInsets.all(10)),
              const Center(child: SelectFacultyDropButton()),
              const Padding(padding: EdgeInsets.all(16)),
              const Text(
                '学科を入力してください',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const TextField(),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Center(
                child: PrimaryButton(
                  width: MediaQuery.of(context).size.width * 0.8,
                  onPressed: () async {
                    await _navigateToBasePage(context);
                  },
                  text: '次へ進む',
                ),
              ),
            ],
          ),
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
