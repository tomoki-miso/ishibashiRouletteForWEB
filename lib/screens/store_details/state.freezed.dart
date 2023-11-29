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
mixin _$ListDetailState {
  StoreClass get storeClass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListDetailStateCopyWith<ListDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListDetailStateCopyWith<$Res> {
  factory $ListDetailStateCopyWith(
          ListDetailState value, $Res Function(ListDetailState) then) =
      _$ListDetailStateCopyWithImpl<$Res, ListDetailState>;
  @useResult
  $Res call({StoreClass storeClass});

  $StoreClassCopyWith<$Res> get storeClass;
}

/// @nodoc
class _$ListDetailStateCopyWithImpl<$Res, $Val extends ListDetailState>
    implements $ListDetailStateCopyWith<$Res> {
  _$ListDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeClass = null,
  }) {
    return _then(_value.copyWith(
      storeClass: null == storeClass
          ? _value.storeClass
          : storeClass // ignore: cast_nullable_to_non_nullable
              as StoreClass,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreClassCopyWith<$Res> get storeClass {
    return $StoreClassCopyWith<$Res>(_value.storeClass, (value) {
      return _then(_value.copyWith(storeClass: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListDetailStateImplCopyWith<$Res>
    implements $ListDetailStateCopyWith<$Res> {
  factory _$$ListDetailStateImplCopyWith(_$ListDetailStateImpl value,
          $Res Function(_$ListDetailStateImpl) then) =
      __$$ListDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreClass storeClass});

  @override
  $StoreClassCopyWith<$Res> get storeClass;
}

/// @nodoc
class __$$ListDetailStateImplCopyWithImpl<$Res>
    extends _$ListDetailStateCopyWithImpl<$Res, _$ListDetailStateImpl>
    implements _$$ListDetailStateImplCopyWith<$Res> {
  __$$ListDetailStateImplCopyWithImpl(
      _$ListDetailStateImpl _value, $Res Function(_$ListDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeClass = null,
  }) {
    return _then(_$ListDetailStateImpl(
      storeClass: null == storeClass
          ? _value.storeClass
          : storeClass // ignore: cast_nullable_to_non_nullable
              as StoreClass,
    ));
  }
}

/// @nodoc

class _$ListDetailStateImpl implements _ListDetailState {
  const _$ListDetailStateImpl({required this.storeClass});

  @override
  final StoreClass storeClass;

  @override
  String toString() {
    return 'ListDetailState(storeClass: $storeClass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListDetailStateImpl &&
            (identical(other.storeClass, storeClass) ||
                other.storeClass == storeClass));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListDetailStateImplCopyWith<_$ListDetailStateImpl> get copyWith =>
      __$$ListDetailStateImplCopyWithImpl<_$ListDetailStateImpl>(
          this, _$identity);
}

abstract class _ListDetailState implements ListDetailState {
  const factory _ListDetailState({required final StoreClass storeClass}) =
      _$ListDetailStateImpl;

  @override
  StoreClass get storeClass;
  @override
  @JsonKey(ignore: true)
  _$$ListDetailStateImplCopyWith<_$ListDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
