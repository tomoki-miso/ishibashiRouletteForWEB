import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/screens/questionnaire/componants/select_gender_drop_button.dart';
import 'package:ishibashi/screens/questionnaire/componants/select_occupation_drop_button.dart';
import 'package:ishibashi/screens/questionnaire/page/next_questionaire.dart';
import 'package:ishibashi/screens/questionnaire/view_model.dart';

class QuestionnairePage extends ConsumerWidget {
  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionnaireViewModelProvider);

    return state.when(
      data: (data) => Scaffold(
        appBar: AppBar(title: const Text('ユーザー登録')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(50)),
                const Text(
                  'ニックネーム',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const TextField(),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Row(
                  children: [
                    Text(
                      '性別',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    SelectGenderDropButton(),
                  ],
                ),
                // ignore: prefer_const_constructors
                Row(
                  children: const [
                    Text(
                      '職業など',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    SelectOccupationDropButton(),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(20)),
                Center(
                  child: PrimaryButton(
                    width: MediaQuery.of(context).size.width * 0.8,
                    onPressed: () async {
                      if (data.selectedOccupation == 'ouStudent') {
                        await _navigateToNextQuestionanairePage(context);
                      } else {
                        await _navigateToBasePage(context);
                      }
                    },
                    text: '次へ進む',
                  ),
                ),
              ],
            ),
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

Future<void> _navigateToNextQuestionanairePage(BuildContext context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const NextQuestionnairePage()),
  );
}
