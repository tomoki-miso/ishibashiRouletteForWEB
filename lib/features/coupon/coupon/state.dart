import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
import 'package:ishibashi/domain/user_info/domain_user_info.dart';

// 生成されるdartファイルを記述
part 'state.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class CouponState with _$CouponState {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory CouponState({
    required Coupon coupon,
    required UserInfoClass userInfo,
    @Default(false) bool isLoading,
  }) = _CouponState;
}
