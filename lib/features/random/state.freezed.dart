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
mixin _$RandomState {
  StoreClass get storeClass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RandomStateCopyWith<RandomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RandomStateCopyWith<$Res> {
  factory $RandomStateCopyWith(
          RandomState value, $Res Function(RandomState) then) =
      _$RandomStateCopyWithImpl<$Res, RandomState>;
  @useResult
  $Res call({StoreClass storeClass});

  $StoreClassCopyWith<$Res> get storeClass;
}

/// @nodoc
class _$RandomStateCopyWithImpl<$Res, $Val extends RandomState>
    implements $RandomStateCopyWith<$Res> {
  _$RandomStateCopyWithImpl(this._value, this._then);

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
abstract class _$$RandomStateImplCopyWith<$Res>
    implements $RandomStateCopyWith<$Res> {
  factory _$$RandomStateImplCopyWith(
          _$RandomStateImpl value, $Res Function(_$RandomStateImpl) then) =
      __$$RandomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreClass storeClass});

  @override
  $StoreClassCopyWith<$Res> get storeClass;
}

/// @nodoc
class __$$RandomStateImplCopyWithImpl<$Res>
    extends _$RandomStateCopyWithImpl<$Res, _$RandomStateImpl>
    implements _$$RandomStateImplCopyWith<$Res> {
  __$$RandomStateImplCopyWithImpl(
      _$RandomStateImpl _value, $Res Function(_$RandomStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeClass = null,
  }) {
    return _then(_$RandomStateImpl(
      storeClass: null == storeClass
          ? _value.storeClass
          : storeClass // ignore: cast_nullable_to_non_nullable
              as StoreClass,
    ));
  }
}

/// @nodoc

class _$RandomStateImpl implements _RandomState {
  const _$RandomStateImpl({required this.storeClass});

  @override
  final StoreClass storeClass;

  @override
  String toString() {
    return 'RandomState(storeClass: $storeClass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RandomStateImpl &&
            (identical(other.storeClass, storeClass) ||
                other.storeClass == storeClass));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RandomStateImplCopyWith<_$RandomStateImpl> get copyWith =>
      __$$RandomStateImplCopyWithImpl<_$RandomStateImpl>(this, _$identity);
}

abstract class _RandomState implements RandomState {
  const factory _RandomState({required final StoreClass storeClass}) =
      _$RandomStateImpl;

  @override
  StoreClass get storeClass;
  @override
  @JsonKey(ignore: true)
  _$$RandomStateImplCopyWith<_$RandomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
