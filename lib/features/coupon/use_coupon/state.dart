import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishibashi/domain/owned_coupon/domain.dart';

// 生成されるdartファイルを記述
part 'state.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class UseCouponState with _$UseCouponState {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory UseCouponState({
    required OwnedCoupon coupon,
    @Default(false) bool isLoading,
  }) = _UseCouponState;
}
