///////// a. パッケージをインポートし、自動生成されるファイルを記述 /////////
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'store_class.freezed.dart';
part 'store_class.g.dart';
///////// b. コード生成するためのクラスを作成 /////////

// freezedでコード生成するために「@freezed」を記述

@freezed
class StoreClass with _$StoreClass {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory StoreClass({
    required String documentId,
    String? storeName,
    String? storeDetail,
    String? storeWeb,
    String? storeTwitter,
    String? storeInsta,
    String? storeInstaPosts,
    String? storeTabelog,
    String? storePhotoUrl,
    String? openTime,
    String? closeTime,
    String? openTimeSecond,
    String? closeTimeSecond,
    String? remarksTime,
    String? remarksDay,
    List<String>? tags,
    List<String>? businessDays,
  }) = _StoreClass;
  factory StoreClass.fromJson(Map<String, dynamic> json) =>
      _$StoreClassFromJson(json);

  static String collectionName = 'stores';
}
