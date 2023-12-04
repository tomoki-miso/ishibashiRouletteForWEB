// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponImpl _$$CouponImplFromJson(Map<String, dynamic> json) => _$CouponImpl(
      couponId: json['couponId'] as String,
      storeName: json['storeName'] as String,
      couponName: json['couponName'] as String,
      couponDetail: json['couponDetail'] as String,
      expiration: DateTime.parse(json['expiration'] as String),
      remainingAmount: json['remainingAmount'] as int,
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CouponImplToJson(_$CouponImpl instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'storeName': instance.storeName,
      'couponName': instance.couponName,
      'couponDetail': instance.couponDetail,
      'expiration': instance.expiration.toIso8601String(),
      'remainingAmount': instance.remainingAmount,
      'users': instance.users,
    };
