// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OwnedCouponImpl _$$OwnedCouponImplFromJson(Map<String, dynamic> json) =>
    _$OwnedCouponImpl(
      couponId: json['couponId'] as String,
      storeId: json['storeId'] as String?,
      storeName: json['storeName'] as String?,
      couponName: json['couponName'] as String?,
      couponDetail: json['couponDetail'] as String?,
      couponImage: json['couponImage'] as String?,
      expiration: json['expiration'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      couponGotAt: json['couponGotAt'] == null
          ? null
          : DateTime.parse(json['couponGotAt'] as String),
    );

Map<String, dynamic> _$$OwnedCouponImplToJson(_$OwnedCouponImpl instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'couponName': instance.couponName,
      'couponDetail': instance.couponDetail,
      'couponImage': instance.couponImage,
      'expiration': instance.expiration,
      'isAvailable': instance.isAvailable,
      'couponGotAt': instance.couponGotAt?.toIso8601String(),
    };
