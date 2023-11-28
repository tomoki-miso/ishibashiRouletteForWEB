///////// a. パッケージをインポートし、自動生成されるファイルを記述 /////////
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'domain.freezed.dart';
part 'domain.g.dart';
///////// b. コード生成するためのクラスを作成 /////////

// freezedでコード生成するために「@freezed」を記述

@freezed
class UserInfo with _$UserInfo {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory UserInfo({
    required String userId,
    required String userName,
    required String gender,
    required String ocupation,
    required String faculty,
    required String department,
    required DateTime createdAt,
  }) = _UserInfo;
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
