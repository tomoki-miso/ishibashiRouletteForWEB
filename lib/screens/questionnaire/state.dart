import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'state.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class QuestionnaireState with _$QuestionnaireState {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory QuestionnaireState({
    required TextEditingController userNameController,
    required String selectedGender,
    required String selectedOccupation,
    required Map<String, String> dropDownGenderMap,
    required Map<String, String> dropDownOccupationMap,
  }) = _QuestionnaireState;
}
