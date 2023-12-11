import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishibashi/domain/coupon/domain.dart';

// 生成されるdartファイルを記述
part 'state.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class CouponDisplayState with _$CouponDisplayState {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory CouponDisplayState({
    required Coupon coupon,
    @Default(false) bool isLoading,
  }) = _CouponDisplayState;
}
