import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'state.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class OwnedCouponListState with _$OwnedCouponListState {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory OwnedCouponListState({
    required List couponList,
    @Default(false) bool isLoading,
  }) = _OwnedCouponListState;
}
