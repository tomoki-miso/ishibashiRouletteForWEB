// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreClassImpl _$$StoreClassImplFromJson(Map<String, dynamic> json) =>
    _$StoreClassImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      detail: json['detail'] as String?,
      web: json['web'] as String?,
      twitter: json['twitter'] as String?,
      insta: json['insta'] as String?,
      instaPosts: json['instaPosts'] as String?,
      tabelog: json['tabelog'] as String?,
      photo_url: json['photo_url'] as String?,
      formattedOpenTime: json['formattedOpenTime'] as String?,
      formattedCloseTime: json['formattedCloseTime'] as String?,
      formattedOpenTimeSecond: json['formattedOpenTimeSecond'] as String?,
      formattedCloseTimeSecond: json['formattedCloseTimeSecond'] as String?,
      remarksTime: json['remarksTime'] as String?,
      remarksDay: json['remarksDay'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$StoreClassImplToJson(_$StoreClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'detail': instance.detail,
      'web': instance.web,
      'twitter': instance.twitter,
      'insta': instance.insta,
      'instaPosts': instance.instaPosts,
      'tabelog': instance.tabelog,
      'photo_url': instance.photo_url,
      'formattedOpenTime': instance.formattedOpenTime,
      'formattedCloseTime': instance.formattedCloseTime,
      'formattedOpenTimeSecond': instance.formattedOpenTimeSecond,
      'formattedCloseTimeSecond': instance.formattedCloseTimeSecond,
      'remarksTime': instance.remarksTime,
      'remarksDay': instance.remarksDay,
      'tags': instance.tags,
      'daysOfWeek': instance.daysOfWeek,
    };
