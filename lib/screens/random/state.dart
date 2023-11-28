import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishibashi/domain/store/store_class.dart';

// 生成されるdartファイルを記述
part 'state.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class RandomState with _$RandomState {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory RandomState({
    required StoreClass storeClass,
  }) = _EditBookDetailsState;
}
