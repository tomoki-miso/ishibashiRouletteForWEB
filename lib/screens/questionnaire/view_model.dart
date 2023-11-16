import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/questionnaire/state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class QuestionnaireViewModel extends _$QuestionnaireViewModel {
  @override
  FutureOr<QuestionnaireState> build() async {
    final state = QuestionnaireState(
      userNameController: TextEditingController(),
      selectedGender: 'male',
      selectedOccupation: 'ouStudent',
      dropDownGenderMap: {
        'male': '男',
        'female': '女',
        'other': '無回答',
      },
      dropDownOccupationMap: {
        'ouStudent': '阪大生',
        'uStudent': '大学生',
        'employee': '会社員',
        'self_employed': '自営業',
        'housewife': '主婦',
        'unemployed': '無職',
        'eStudent': '小学生',
        'jhStudent': '中学生',
        'hStudent': '高校生',
      },
    );

    ref.onDispose(() {
      print('破棄されました');
      state.userNameController.dispose();
    });

    return state;
  }

  Future<void> selectGender(gender) async {
    final data = state.requireValue;
    state = AsyncData(data.copyWith(selectedGender: gender));
  }

  Future<void> selectOccupation(occupation) async {
    final data = state.requireValue;
    state = AsyncData(data.copyWith(selectedOccupation: occupation));
  }
}
