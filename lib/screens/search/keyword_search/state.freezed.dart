// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KeywordSearchState {
  List<dynamic> get searchResultStoreList => throw _privateConstructorUsedError;
  TextEditingController get searchWordController =>
      throw _privateConstructorUsedError;
  String? get searchWord => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeywordSearchStateCopyWith<KeywordSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeywordSearchStateCopyWith<$Res> {
  factory $KeywordSearchStateCopyWith(
          KeywordSearchState value, $Res Function(KeywordSearchState) then) =
      _$KeywordSearchStateCopyWithImpl<$Res, KeywordSearchState>;
  @useResult
  $Res call(
      {List<dynamic> searchResultStoreList,
      TextEditingController searchWordController,
      String? searchWord});
}

/// @nodoc
class _$KeywordSearchStateCopyWithImpl<$Res, $Val extends KeywordSearchState>
    implements $KeywordSearchStateCopyWith<$Res> {
  _$KeywordSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResultStoreList = null,
    Object? searchWordController = null,
    Object? searchWord = freezed,
  }) {
    return _then(_value.copyWith(
      searchResultStoreList: null == searchResultStoreList
          ? _value.searchResultStoreList
          : searchResultStoreList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      searchWordController: null == searchWordController
          ? _value.searchWordController
          : searchWordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      searchWord: freezed == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeywordSearchStateImplCopyWith<$Res>
    implements $KeywordSearchStateCopyWith<$Res> {
  factory _$$KeywordSearchStateImplCopyWith(_$KeywordSearchStateImpl value,
          $Res Function(_$KeywordSearchStateImpl) then) =
      __$$KeywordSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> searchResultStoreList,
      TextEditingController searchWordController,
      String? searchWord});
}

/// @nodoc
class __$$KeywordSearchStateImplCopyWithImpl<$Res>
    extends _$KeywordSearchStateCopyWithImpl<$Res, _$KeywordSearchStateImpl>
    implements _$$KeywordSearchStateImplCopyWith<$Res> {
  __$$KeywordSearchStateImplCopyWithImpl(_$KeywordSearchStateImpl _value,
      $Res Function(_$KeywordSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResultStoreList = null,
    Object? searchWordController = null,
    Object? searchWord = freezed,
  }) {
    return _then(_$KeywordSearchStateImpl(
      searchResultStoreList: null == searchResultStoreList
          ? _value._searchResultStoreList
          : searchResultStoreList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      searchWordController: null == searchWordController
          ? _value.searchWordController
          : searchWordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      searchWord: freezed == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$KeywordSearchStateImpl implements _KeywordSearchState {
  const _$KeywordSearchStateImpl(
      {required final List<dynamic> searchResultStoreList,
      required this.searchWordController,
      this.searchWord})
      : _searchResultStoreList = searchResultStoreList;

  final List<dynamic> _searchResultStoreList;
  @override
  List<dynamic> get searchResultStoreList {
    if (_searchResultStoreList is EqualUnmodifiableListView)
      return _searchResultStoreList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResultStoreList);
  }

  @override
  final TextEditingController searchWordController;
  @override
  final String? searchWord;

  @override
  String toString() {
    return 'KeywordSearchState(searchResultStoreList: $searchResultStoreList, searchWordController: $searchWordController, searchWord: $searchWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeywordSearchStateImpl &&
            const DeepCollectionEquality()
                .equals(other._searchResultStoreList, _searchResultStoreList) &&
            (identical(other.searchWordController, searchWordController) ||
                other.searchWordController == searchWordController) &&
            (identical(other.searchWord, searchWord) ||
                other.searchWord == searchWord));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchResultStoreList),
      searchWordController,
      searchWord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeywordSearchStateImplCopyWith<_$KeywordSearchStateImpl> get copyWith =>
      __$$KeywordSearchStateImplCopyWithImpl<_$KeywordSearchStateImpl>(
          this, _$identity);
}

abstract class _KeywordSearchState implements KeywordSearchState {
  const factory _KeywordSearchState(
      {required final List<dynamic> searchResultStoreList,
      required final TextEditingController searchWordController,
      final String? searchWord}) = _$KeywordSearchStateImpl;

  @override
  List<dynamic> get searchResultStoreList;
  @override
  TextEditingController get searchWordController;
  @override
  String? get searchWord;
  @override
  @JsonKey(ignore: true)
  _$$KeywordSearchStateImplCopyWith<_$KeywordSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
