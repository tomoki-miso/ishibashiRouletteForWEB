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
  List<StoreClass> get storeIsBusinessDayStores =>
      throw _privateConstructorUsedError;
  List<StoreClass> get storeIsNotBusinessDayStores =>
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
      {List<StoreClass> storeIsBusinessDayStores,
      List<StoreClass> storeIsNotBusinessDayStores});
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
    Object? storeIsBusinessDayStores = null,
    Object? storeIsNotBusinessDayStores = null,
  }) {
    return _then(_value.copyWith(
      storeIsBusinessDayStores: null == storeIsBusinessDayStores
          ? _value.storeIsBusinessDayStores
          : storeIsBusinessDayStores // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      storeIsNotBusinessDayStores: null == storeIsNotBusinessDayStores
          ? _value.storeIsNotBusinessDayStores
          : storeIsNotBusinessDayStores // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
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
      {List<StoreClass> storeIsBusinessDayStores,
      List<StoreClass> storeIsNotBusinessDayStores});
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
    Object? storeIsBusinessDayStores = null,
    Object? storeIsNotBusinessDayStores = null,
  }) {
    return _then(_$ListStateImpl(
      storeIsBusinessDayStores: null == storeIsBusinessDayStores
          ? _value._storeIsBusinessDayStores
          : storeIsBusinessDayStores // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      storeIsNotBusinessDayStores: null == storeIsNotBusinessDayStores
          ? _value._storeIsNotBusinessDayStores
          : storeIsNotBusinessDayStores // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
    ));
  }
}

/// @nodoc

class _$ListStateImpl implements _ListState {
  const _$ListStateImpl(
      {required final List<StoreClass> storeIsBusinessDayStores,
      required final List<StoreClass> storeIsNotBusinessDayStores})
      : _storeIsBusinessDayStores = storeIsBusinessDayStores,
        _storeIsNotBusinessDayStores = storeIsNotBusinessDayStores;

  final List<StoreClass> _storeIsBusinessDayStores;
  @override
  List<StoreClass> get storeIsBusinessDayStores {
    if (_storeIsBusinessDayStores is EqualUnmodifiableListView)
      return _storeIsBusinessDayStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeIsBusinessDayStores);
  }

  final List<StoreClass> _storeIsNotBusinessDayStores;
  @override
  List<StoreClass> get storeIsNotBusinessDayStores {
    if (_storeIsNotBusinessDayStores is EqualUnmodifiableListView)
      return _storeIsNotBusinessDayStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeIsNotBusinessDayStores);
  }

  @override
  String toString() {
    return 'ListState(storeIsBusinessDayStores: $storeIsBusinessDayStores, storeIsNotBusinessDayStores: $storeIsNotBusinessDayStores)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStateImpl &&
            const DeepCollectionEquality().equals(
                other._storeIsBusinessDayStores, _storeIsBusinessDayStores) &&
            const DeepCollectionEquality().equals(
                other._storeIsNotBusinessDayStores,
                _storeIsNotBusinessDayStores));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_storeIsBusinessDayStores),
      const DeepCollectionEquality().hash(_storeIsNotBusinessDayStores));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListStateImplCopyWith<_$ListStateImpl> get copyWith =>
      __$$ListStateImplCopyWithImpl<_$ListStateImpl>(this, _$identity);
}

abstract class _ListState implements ListState {
  const factory _ListState(
          {required final List<StoreClass> storeIsBusinessDayStores,
          required final List<StoreClass> storeIsNotBusinessDayStores}) =
      _$ListStateImpl;

  @override
  List<StoreClass> get storeIsBusinessDayStores;
  @override
  List<StoreClass> get storeIsNotBusinessDayStores;
  @override
  @JsonKey(ignore: true)
  _$$ListStateImplCopyWith<_$ListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
