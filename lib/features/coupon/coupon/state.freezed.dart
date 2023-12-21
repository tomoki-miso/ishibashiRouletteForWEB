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
mixin _$CouponState {
  Coupon get coupon => throw _privateConstructorUsedError;
  UserInfoClass get userInfo => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CouponStateCopyWith<CouponState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponStateCopyWith<$Res> {
  factory $CouponStateCopyWith(
          CouponState value, $Res Function(CouponState) then) =
      _$CouponStateCopyWithImpl<$Res, CouponState>;
  @useResult
  $Res call({Coupon coupon, UserInfoClass userInfo, bool isLoading});

  $CouponCopyWith<$Res> get coupon;
  $UserInfoClassCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$CouponStateCopyWithImpl<$Res, $Val extends CouponState>
    implements $CouponStateCopyWith<$Res> {
  _$CouponStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupon = null,
    Object? userInfo = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoClass,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CouponCopyWith<$Res> get coupon {
    return $CouponCopyWith<$Res>(_value.coupon, (value) {
      return _then(_value.copyWith(coupon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoClassCopyWith<$Res> get userInfo {
    return $UserInfoClassCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CouponStateImplCopyWith<$Res>
    implements $CouponStateCopyWith<$Res> {
  factory _$$CouponStateImplCopyWith(
          _$CouponStateImpl value, $Res Function(_$CouponStateImpl) then) =
      __$$CouponStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Coupon coupon, UserInfoClass userInfo, bool isLoading});

  @override
  $CouponCopyWith<$Res> get coupon;
  @override
  $UserInfoClassCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$CouponStateImplCopyWithImpl<$Res>
    extends _$CouponStateCopyWithImpl<$Res, _$CouponStateImpl>
    implements _$$CouponStateImplCopyWith<$Res> {
  __$$CouponStateImplCopyWithImpl(
      _$CouponStateImpl _value, $Res Function(_$CouponStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupon = null,
    Object? userInfo = null,
    Object? isLoading = null,
  }) {
    return _then(_$CouponStateImpl(
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoClass,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CouponStateImpl implements _CouponState {
  const _$CouponStateImpl(
      {required this.coupon, required this.userInfo, this.isLoading = false});

  @override
  final Coupon coupon;
  @override
  final UserInfoClass userInfo;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CouponState(coupon: $coupon, userInfo: $userInfo, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponStateImpl &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coupon, userInfo, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponStateImplCopyWith<_$CouponStateImpl> get copyWith =>
      __$$CouponStateImplCopyWithImpl<_$CouponStateImpl>(this, _$identity);
}

abstract class _CouponState implements CouponState {
  const factory _CouponState(
      {required final Coupon coupon,
      required final UserInfoClass userInfo,
      final bool isLoading}) = _$CouponStateImpl;

  @override
  Coupon get coupon;
  @override
  UserInfoClass get userInfo;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CouponStateImplCopyWith<_$CouponStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
