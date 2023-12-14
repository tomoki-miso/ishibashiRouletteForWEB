import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'domain.freezed.dart';
part 'domain.g.dart';
///////// b. コード生成するためのクラスを作成 /////////

// freezedでコード生成するために「@freezed」を記述

@freezed
class OwnedCoupon with _$OwnedCoupon {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory OwnedCoupon({
    required String couponId,
    String? storeId,
    String? storeName,
    String? couponName,
    String? couponDetail,
    String? couponImage,
    String? expiration,
    bool? isAvailable,
    DateTime? couponGotAt,
  }) = _OwnedCoupon;
  factory OwnedCoupon.fromJson(Map<String, dynamic> json) =>
      _$OwnedCouponFromJson(json);
}
