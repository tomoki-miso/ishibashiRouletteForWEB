import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'state.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class RandomState with _$RandomState {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory RandomState({
    required String documentId,
    required String storeName,
    required String storeDetail,
    required String storeWeb,
    required String storeTwitter,
    required String storeInsta,
    required String storeTabelog,
    required String storePhotoUrl,
    required List<String> tags,
  }) = _EditBookDetailsState;
}
