// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreClassImpl _$$StoreClassImplFromJson(Map<String, dynamic> json) =>
    _$StoreClassImpl(
      DocumentId: json['DocumentId'] as String,
      StoreName: json['StoreName'] as String,
      StoreDetail: json['StoreDetail'] as String,
      StoreWeb: json['StoreWeb'] as String,
      StoreTwitter: json['StoreTwitter'] as String,
      StoreInsta: json['StoreInsta'] as String,
      StoreTabelog: json['StoreTabelog'] as String,
      StorePhotoUrl: json['StorePhotoUrl'] as String,
      Tags: (json['Tags'] as List<dynamic>).map((e) => e as String).toList(),
      isPremium: json['isPremium'] as bool? ?? false,
    );

Map<String, dynamic> _$$StoreClassImplToJson(_$StoreClassImpl instance) =>
    <String, dynamic>{
      'DocumentId': instance.DocumentId,
      'StoreName': instance.StoreName,
      'StoreDetail': instance.StoreDetail,
      'StoreWeb': instance.StoreWeb,
      'StoreTwitter': instance.StoreTwitter,
      'StoreInsta': instance.StoreInsta,
      'StoreTabelog': instance.StoreTabelog,
      'StorePhotoUrl': instance.StorePhotoUrl,
      'Tags': instance.Tags,
      'isPremium': instance.isPremium,
    };
