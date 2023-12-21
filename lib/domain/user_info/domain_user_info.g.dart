// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoClassImpl _$$UserInfoClassImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoClassImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String?,
      gender: json['gender'] as String?,
      occupation: json['occupation'] as String?,
      faculty: json['faculty'] as String?,
      department: json['department'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isCanGetCoupon: json['isCanGetCoupon'] as bool?,
    );

Map<String, dynamic> _$$UserInfoClassImplToJson(_$UserInfoClassImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'gender': instance.gender,
      'occupation': instance.occupation,
      'faculty': instance.faculty,
      'department': instance.department,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isCanGetCoupon': instance.isCanGetCoupon,
    };
