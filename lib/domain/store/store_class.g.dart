// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreClassImpl _$$StoreClassImplFromJson(Map<String, dynamic> json) =>
    _$StoreClassImpl(
      documentId: json['documentId'] as String,
      storeName: json['storeName'] as String?,
      storeDetail: json['storeDetail'] as String?,
      storeWeb: json['storeWeb'] as String?,
      storeTwitter: json['storeTwitter'] as String?,
      storeInsta: json['storeInsta'] as String?,
      storeTabelog: json['storeTabelog'] as String?,
      storePhotoUrl: json['storePhotoUrl'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$StoreClassImplToJson(_$StoreClassImpl instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'storeName': instance.storeName,
      'storeDetail': instance.storeDetail,
      'storeWeb': instance.storeWeb,
      'storeTwitter': instance.storeTwitter,
      'storeInsta': instance.storeInsta,
      'storeTabelog': instance.storeTabelog,
      'storePhotoUrl': instance.storePhotoUrl,
      'tags': instance.tags,
    };
