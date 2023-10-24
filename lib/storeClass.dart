///////// a. パッケージをインポートし、自動生成されるファイルを記述 /////////
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'storeClass.freezed.dart';
part 'storeClass.g.dart';
///////// b. コード生成するためのクラスを作成 /////////

// freezedでコード生成するために「@freezed」を記述

@freezed
class StoreClass with _$StoreClass {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory StoreClass({
    required String DocumentId,
    required String StoreName,
    required String StoreDetail,
    required String StoreWeb,
    required String StoreTwitter,
    required String StoreInsta,
    required String StoreTabelog,
    required String StorePhotoUrl,
    required List<String> Tags,
    @Default(false) bool isPremium, // デフォルト値は「@Default([デフォルト値])」の形式で指定可能
  }) = _StoreClass;
  factory StoreClass.fromJson(Map<String, dynamic> json) => _$StoreClassFromJson(json);
}
