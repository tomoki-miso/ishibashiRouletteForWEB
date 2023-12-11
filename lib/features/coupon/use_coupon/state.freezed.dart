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
mixin _$UseCouponState {
  OwnedCoupon get coupon => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UseCouponStateCopyWith<UseCouponState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseCouponStateCopyWith<$Res> {
  factory $UseCouponStateCopyWith(
          UseCouponState value, $Res Function(UseCouponState) then) =
      _$UseCouponStateCopyWithImpl<$Res, UseCouponState>;
  @useResult
  $Res call({OwnedCoupon coupon, bool isLoading});

  $OwnedCouponCopyWith<$Res> get coupon;
}

/// @nodoc
class _$UseCouponStateCopyWithImpl<$Res, $Val extends UseCouponState>
    implements $UseCouponStateCopyWith<$Res> {
  _$UseCouponStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupon = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as OwnedCoupon,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnedCouponCopyWith<$Res> get coupon {
    return $OwnedCouponCopyWith<$Res>(_value.coupon, (value) {
      return _then(_value.copyWith(coupon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UseCouponStateImplCopyWith<$Res>
    implements $UseCouponStateCopyWith<$Res> {
  factory _$$UseCouponStateImplCopyWith(_$UseCouponStateImpl value,
          $Res Function(_$UseCouponStateImpl) then) =
      __$$UseCouponStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OwnedCoupon coupon, bool isLoading});

  @override
  $OwnedCouponCopyWith<$Res> get coupon;
}

/// @nodoc
class __$$UseCouponStateImplCopyWithImpl<$Res>
    extends _$UseCouponStateCopyWithImpl<$Res, _$UseCouponStateImpl>
    implements _$$UseCouponStateImplCopyWith<$Res> {
  __$$UseCouponStateImplCopyWithImpl(
      _$UseCouponStateImpl _value, $Res Function(_$UseCouponStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupon = null,
    Object? isLoading = null,
  }) {
    return _then(_$UseCouponStateImpl(
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as OwnedCoupon,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UseCouponStateImpl implements _UseCouponState {
  const _$UseCouponStateImpl({required this.coupon, this.isLoading = false});

  @override
  final OwnedCoupon coupon;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'UseCouponState(coupon: $coupon, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UseCouponStateImpl &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coupon, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UseCouponStateImplCopyWith<_$UseCouponStateImpl> get copyWith =>
      __$$UseCouponStateImplCopyWithImpl<_$UseCouponStateImpl>(
          this, _$identity);
}

abstract class _UseCouponState implements UseCouponState {
  const factory _UseCouponState(
      {required final OwnedCoupon coupon,
      final bool isLoading}) = _$UseCouponStateImpl;

  @override
  OwnedCoupon get coupon;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$UseCouponStateImplCopyWith<_$UseCouponStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
