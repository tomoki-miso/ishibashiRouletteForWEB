// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponImpl _$$CouponImplFromJson(Map<String, dynamic> json) => _$CouponImpl(
      couponId: json['couponId'] as String,
      storeId: json['storeId'] as String,
      storeName: json['storeName'] as String,
      couponName: json['couponName'] as String,
      couponDetail: json['couponDetail'] as String,
      couponImage: json['couponImage'] as String,
      expiration: json['expiration'] as String,
      remainingAmount: json['remainingAmount'] as int?,
    );

Map<String, dynamic> _$$CouponImplToJson(_$CouponImpl instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'couponName': instance.couponName,
      'couponDetail': instance.couponDetail,
      'couponImage': instance.couponImage,
      'expiration': instance.expiration,
      'remainingAmount': instance.remainingAmount,
    };
