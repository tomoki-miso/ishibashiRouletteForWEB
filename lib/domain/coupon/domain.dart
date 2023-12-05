import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'domain.freezed.dart';
part 'domain.g.dart';
///////// b. コード生成するためのクラスを作成 /////////

// freezedでコード生成するために「@freezed」を記述

@freezed
class Coupon with _$Coupon {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory Coupon({
    required String couponId,
    required String storeId,
    required String storeName,
    required String couponName,
    required String couponDetail,
    required String couponImage,
    required String expiration,
    required num remainingAmount,
  }) = _Coupon;
  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  static String collectionName = 'coupon';
}
