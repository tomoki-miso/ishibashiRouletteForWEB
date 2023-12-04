import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/domain/user_info/domain_user_info.dart';
import 'package:ishibashi/features/questionnaire/page/next_questionaire.dart';
import 'package:ishibashi/features/questionnaire/state.dart';
import 'package:ishibashi/repositories/user_info/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class QuestionnaireViewModel extends _$QuestionnaireViewModel {
  UserInfoRepo get userInfoRepo => ref.read(userInfoRepoProvider.notifier);

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

  Future<void> inputUserName() async {
    final data = state.requireValue;
    state =
        AsyncData(data.copyWith(inputedUserName: data.userNameController.text));
  }

  Future<void> inputDepartment() async {
    final data = state.requireValue;
    state = AsyncData(
      data.copyWith(inputedDepartment: data.departmentController.text),
    );
  }

  Future<void> navigateToBasePage(BuildContext context) async {
    await saveUserInfo();
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BasePage()),
    );
  }

  Future<void> navigateToNextQuestionanairePage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NextQuestionnairePage()),
    );
  }

  Future<void> saveUserInfo() async {
    final data = state.requireValue;
    final DomainUserInfo userInfo = DomainUserInfo(
      userId: FirebaseAuth.instance.currentUser!.uid,
      userName: data.inputedUserName,
      gender: data.selectedGender,
      occupation: data.selectedOccupation,
      faculty: data.selectedFaculty,
      department: data.inputedDepartment,
      createdAt: DateTime.now(),
    );

    await userInfoRepo.saveUserInfo(userInfo).then((value) {
      data.userNameController.clear();
      data.departmentController.clear();
    });
  }
}
