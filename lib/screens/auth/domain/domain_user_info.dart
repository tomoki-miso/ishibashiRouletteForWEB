import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'domain_user_info.freezed.dart';
part 'domain_user_info.g.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class UserInfo with _$UserInfo {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory UserInfo({
    required String userId,
    required String gender,
    required String occupation,
    required String faculty,
    required String department,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}