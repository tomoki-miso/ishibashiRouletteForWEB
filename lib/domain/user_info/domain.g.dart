// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      gender: json['gender'] as String,
      ocupation: json['ocupation'] as String,
      faculty: json['faculty'] as String,
      department: json['department'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'gender': instance.gender,
      'ocupation': instance.ocupation,
      'faculty': instance.faculty,
      'department': instance.department,
      'createdAt': instance.createdAt.toIso8601String(),
    };
