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
  List<StoreClass> get searchedIsBusinessDayStoresByKeyWord =>
      throw _privateConstructorUsedError;
  List<StoreClass> get searchedIsNotBusinessDayStoresByKeyWord =>
      throw _privateConstructorUsedError;
  TextEditingController get searchWordController =>
      throw _privateConstructorUsedError;

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
      {List<StoreClass> searchedIsBusinessDayStoresByKeyWord,
      List<StoreClass> searchedIsNotBusinessDayStoresByKeyWord,
      TextEditingController searchWordController});
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
    Object? searchedIsBusinessDayStoresByKeyWord = null,
    Object? searchedIsNotBusinessDayStoresByKeyWord = null,
    Object? searchWordController = null,
  }) {
    return _then(_value.copyWith(
      searchedIsBusinessDayStoresByKeyWord: null ==
              searchedIsBusinessDayStoresByKeyWord
          ? _value.searchedIsBusinessDayStoresByKeyWord
          : searchedIsBusinessDayStoresByKeyWord // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      searchedIsNotBusinessDayStoresByKeyWord: null ==
              searchedIsNotBusinessDayStoresByKeyWord
          ? _value.searchedIsNotBusinessDayStoresByKeyWord
          : searchedIsNotBusinessDayStoresByKeyWord // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      searchWordController: null == searchWordController
          ? _value.searchWordController
          : searchWordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
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
      {List<StoreClass> searchedIsBusinessDayStoresByKeyWord,
      List<StoreClass> searchedIsNotBusinessDayStoresByKeyWord,
      TextEditingController searchWordController});
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
    Object? searchedIsBusinessDayStoresByKeyWord = null,
    Object? searchedIsNotBusinessDayStoresByKeyWord = null,
    Object? searchWordController = null,
  }) {
    return _then(_$KeywordSearchStateImpl(
      searchedIsBusinessDayStoresByKeyWord: null ==
              searchedIsBusinessDayStoresByKeyWord
          ? _value._searchedIsBusinessDayStoresByKeyWord
          : searchedIsBusinessDayStoresByKeyWord // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      searchedIsNotBusinessDayStoresByKeyWord: null ==
              searchedIsNotBusinessDayStoresByKeyWord
          ? _value._searchedIsNotBusinessDayStoresByKeyWord
          : searchedIsNotBusinessDayStoresByKeyWord // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      searchWordController: null == searchWordController
          ? _value.searchWordController
          : searchWordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$KeywordSearchStateImpl implements _KeywordSearchState {
  const _$KeywordSearchStateImpl(
      {required final List<StoreClass> searchedIsBusinessDayStoresByKeyWord,
      required final List<StoreClass> searchedIsNotBusinessDayStoresByKeyWord,
      required this.searchWordController})
      : _searchedIsBusinessDayStoresByKeyWord =
            searchedIsBusinessDayStoresByKeyWord,
        _searchedIsNotBusinessDayStoresByKeyWord =
            searchedIsNotBusinessDayStoresByKeyWord;

  final List<StoreClass> _searchedIsBusinessDayStoresByKeyWord;
  @override
  List<StoreClass> get searchedIsBusinessDayStoresByKeyWord {
    if (_searchedIsBusinessDayStoresByKeyWord is EqualUnmodifiableListView)
      return _searchedIsBusinessDayStoresByKeyWord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedIsBusinessDayStoresByKeyWord);
  }

  final List<StoreClass> _searchedIsNotBusinessDayStoresByKeyWord;
  @override
  List<StoreClass> get searchedIsNotBusinessDayStoresByKeyWord {
    if (_searchedIsNotBusinessDayStoresByKeyWord is EqualUnmodifiableListView)
      return _searchedIsNotBusinessDayStoresByKeyWord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedIsNotBusinessDayStoresByKeyWord);
  }

  @override
  final TextEditingController searchWordController;

  @override
  String toString() {
    return 'KeywordSearchState(searchedIsBusinessDayStoresByKeyWord: $searchedIsBusinessDayStoresByKeyWord, searchedIsNotBusinessDayStoresByKeyWord: $searchedIsNotBusinessDayStoresByKeyWord, searchWordController: $searchWordController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeywordSearchStateImpl &&
            const DeepCollectionEquality().equals(
                other._searchedIsBusinessDayStoresByKeyWord,
                _searchedIsBusinessDayStoresByKeyWord) &&
            const DeepCollectionEquality().equals(
                other._searchedIsNotBusinessDayStoresByKeyWord,
                _searchedIsNotBusinessDayStoresByKeyWord) &&
            (identical(other.searchWordController, searchWordController) ||
                other.searchWordController == searchWordController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality()
          .hash(_searchedIsBusinessDayStoresByKeyWord),
      const DeepCollectionEquality()
          .hash(_searchedIsNotBusinessDayStoresByKeyWord),
      searchWordController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeywordSearchStateImplCopyWith<_$KeywordSearchStateImpl> get copyWith =>
      __$$KeywordSearchStateImplCopyWithImpl<_$KeywordSearchStateImpl>(
          this, _$identity);
}

abstract class _KeywordSearchState implements KeywordSearchState {
  const factory _KeywordSearchState(
      {required final List<StoreClass> searchedIsBusinessDayStoresByKeyWord,
      required final List<StoreClass> searchedIsNotBusinessDayStoresByKeyWord,
      required final TextEditingController
          searchWordController}) = _$KeywordSearchStateImpl;

  @override
  List<StoreClass> get searchedIsBusinessDayStoresByKeyWord;
  @override
  List<StoreClass> get searchedIsNotBusinessDayStoresByKeyWord;
  @override
  TextEditingController get searchWordController;
  @override
  @JsonKey(ignore: true)
  _$$KeywordSearchStateImplCopyWith<_$KeywordSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
