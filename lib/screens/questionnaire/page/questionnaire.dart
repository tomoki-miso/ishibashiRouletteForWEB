import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionnairePage extends ConsumerWidget {
  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? isSelectedGender = '';
    String? isSelectedOccupation = '';
    return Scaffold(
      body: Column(
        children: [
          Text('ユーザーネーム'),
          TextField(),
          DropdownButton(
            items: const [
              DropdownMenuItem(
                child: Text('男'),
                value: 'male',
              ),
              DropdownMenuItem(
                child: Text('女'),
                value: 'female',
              ),
              DropdownMenuItem(
                child: Text('無回答'),
                value: 'other',
              ),
            ],
            onChanged: (gender) {
              setState(() {
                isSelectedGender = gender;
              });
            },
            value: isSelectedGender,
          ),
          DropdownButton(
            items: const [
              DropdownMenuItem(
                child: Text('大学生(阪大生)'),
                value: 'OU_student',
              ),
              DropdownMenuItem(
                child: Text('大学生'),
                value: 'U_student',
              ),
              DropdownMenuItem(
                child: Text('無回答'),
                value: 'other',
              ),
            ],
            onChanged: (occupation) {
              setState(() {
                isSelectedOccupation = occupation;
              });
            },
            value: isSelectedOccupation,
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
