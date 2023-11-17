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
      selectedGender: 'notSelected',
      selectedOccupation: 'notSelected',
      selectedFaculty: 'notSelected',
      inputedUserName: '',
      inputedDepartment: '',
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

  Future<void> inputUserName(userName) async {
    final data = state.requireValue;
    state = AsyncData(data.copyWith(inputedUserName: userName));
  }

  Future<void> inputDepartment(department) async {
    final data = state.requireValue;
    state = AsyncData(data.copyWith(inputedDepartment: department));
  }
}
