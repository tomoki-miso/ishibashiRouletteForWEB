import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'state.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class KeywordSearchState with _$KeywordSearchState {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory KeywordSearchState({
    required List searchResultStoreList,
    required TextEditingController searchWordController,
  }) = _KeywordSearchState;
}
