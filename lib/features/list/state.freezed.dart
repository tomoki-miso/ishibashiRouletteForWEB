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
mixin _$ListState {
  List<dynamic> get storeIsBusinessDayList =>
      throw _privateConstructorUsedError;
  List<dynamic> get storeIsNotBusinessDayClassList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListStateCopyWith<ListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStateCopyWith<$Res> {
  factory $ListStateCopyWith(ListState value, $Res Function(ListState) then) =
      _$ListStateCopyWithImpl<$Res, ListState>;
  @useResult
  $Res call(
      {List<dynamic> storeIsBusinessDayList,
      List<dynamic> storeIsNotBusinessDayClassList});
}

/// @nodoc
class _$ListStateCopyWithImpl<$Res, $Val extends ListState>
    implements $ListStateCopyWith<$Res> {
  _$ListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeIsBusinessDayList = null,
    Object? storeIsNotBusinessDayClassList = null,
  }) {
    return _then(_value.copyWith(
      storeIsBusinessDayList: null == storeIsBusinessDayList
          ? _value.storeIsBusinessDayList
          : storeIsBusinessDayList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      storeIsNotBusinessDayClassList: null == storeIsNotBusinessDayClassList
          ? _value.storeIsNotBusinessDayClassList
          : storeIsNotBusinessDayClassList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListStateImplCopyWith<$Res>
    implements $ListStateCopyWith<$Res> {
  factory _$$ListStateImplCopyWith(
          _$ListStateImpl value, $Res Function(_$ListStateImpl) then) =
      __$$ListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> storeIsBusinessDayList,
      List<dynamic> storeIsNotBusinessDayClassList});
}

/// @nodoc
class __$$ListStateImplCopyWithImpl<$Res>
    extends _$ListStateCopyWithImpl<$Res, _$ListStateImpl>
    implements _$$ListStateImplCopyWith<$Res> {
  __$$ListStateImplCopyWithImpl(
      _$ListStateImpl _value, $Res Function(_$ListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeIsBusinessDayList = null,
    Object? storeIsNotBusinessDayClassList = null,
  }) {
    return _then(_$ListStateImpl(
      storeIsBusinessDayList: null == storeIsBusinessDayList
          ? _value._storeIsBusinessDayList
          : storeIsBusinessDayList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      storeIsNotBusinessDayClassList: null == storeIsNotBusinessDayClassList
          ? _value._storeIsNotBusinessDayClassList
          : storeIsNotBusinessDayClassList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$ListStateImpl implements _ListState {
  const _$ListStateImpl(
      {required final List<dynamic> storeIsBusinessDayList,
      required final List<dynamic> storeIsNotBusinessDayClassList})
      : _storeIsBusinessDayList = storeIsBusinessDayList,
        _storeIsNotBusinessDayClassList = storeIsNotBusinessDayClassList;

  final List<dynamic> _storeIsBusinessDayList;
  @override
  List<dynamic> get storeIsBusinessDayList {
    if (_storeIsBusinessDayList is EqualUnmodifiableListView)
      return _storeIsBusinessDayList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeIsBusinessDayList);
  }

  final List<dynamic> _storeIsNotBusinessDayClassList;
  @override
  List<dynamic> get storeIsNotBusinessDayClassList {
    if (_storeIsNotBusinessDayClassList is EqualUnmodifiableListView)
      return _storeIsNotBusinessDayClassList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeIsNotBusinessDayClassList);
  }

  @override
  String toString() {
    return 'ListState(storeIsBusinessDayList: $storeIsBusinessDayList, storeIsNotBusinessDayClassList: $storeIsNotBusinessDayClassList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStateImpl &&
            const DeepCollectionEquality().equals(
                other._storeIsBusinessDayList, _storeIsBusinessDayList) &&
            const DeepCollectionEquality().equals(
                other._storeIsNotBusinessDayClassList,
                _storeIsNotBusinessDayClassList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_storeIsBusinessDayList),
      const DeepCollectionEquality().hash(_storeIsNotBusinessDayClassList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListStateImplCopyWith<_$ListStateImpl> get copyWith =>
      __$$ListStateImplCopyWithImpl<_$ListStateImpl>(this, _$identity);
}

abstract class _ListState implements ListState {
  const factory _ListState(
          {required final List<dynamic> storeIsBusinessDayList,
          required final List<dynamic> storeIsNotBusinessDayClassList}) =
      _$ListStateImpl;

  @override
  List<dynamic> get storeIsBusinessDayList;
  @override
  List<dynamic> get storeIsNotBusinessDayClassList;
  @override
  @JsonKey(ignore: true)
  _$$ListStateImplCopyWith<_$ListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
