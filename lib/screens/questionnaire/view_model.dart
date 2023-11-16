import 'package:flutter/material.dart';
import 'package:ishibashi/screens/questionnaire/state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class QuestionnaireViewModel extends _$QuestionnaireViewModel {
  @override
  FutureOr<QuestionnaireState> build() async {
    final state = QuestionnaireState(
      userNameController: TextEditingController(),
      departmentController: TextEditingController(),
      selectedGender: 'male',
      selectedOccupation: 'ouStudent',
      selectedFaculty: 'literature',
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
      dropDownFacultyMap: {
        'literature': '文学部',
        'human_science': '人間科学部',
        'foreignLanguage': '外国語学部',
        'law': '法学部',
        'economics': '経済学部',
        'science': '理学部',
        'medicine': '医学部',
        'dentistry': '歯学部',
        'pharmacy': '薬学部',
        'engineering': '工学部',
        'basicEngineering': '基礎工学部',
      },
    );

    ref.onDispose(() {
      print('破棄されました');
      state.userNameController.dispose();
      state.departmentController.dispose();
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

  Future<void> selectFaculty(faculty) async {
    final data = state.requireValue;
    state = AsyncData(data.copyWith(selectedFaculty: faculty));
  }
}
