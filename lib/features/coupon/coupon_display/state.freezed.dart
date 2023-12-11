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
mixin _$CouponDisplayState {
  Coupon get coupon => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CouponDisplayStateCopyWith<CouponDisplayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponDisplayStateCopyWith<$Res> {
  factory $CouponDisplayStateCopyWith(
          CouponDisplayState value, $Res Function(CouponDisplayState) then) =
      _$CouponDisplayStateCopyWithImpl<$Res, CouponDisplayState>;
  @useResult
  $Res call({Coupon coupon, bool isLoading});

  $CouponCopyWith<$Res> get coupon;
}

/// @nodoc
class _$CouponDisplayStateCopyWithImpl<$Res, $Val extends CouponDisplayState>
    implements $CouponDisplayStateCopyWith<$Res> {
  _$CouponDisplayStateCopyWithImpl(this._value, this._then);

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
              as Coupon,
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
}

/// @nodoc
abstract class _$$CouponDisplayStateImplCopyWith<$Res>
    implements $CouponDisplayStateCopyWith<$Res> {
  factory _$$CouponDisplayStateImplCopyWith(_$CouponDisplayStateImpl value,
          $Res Function(_$CouponDisplayStateImpl) then) =
      __$$CouponDisplayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Coupon coupon, bool isLoading});

  @override
  $CouponCopyWith<$Res> get coupon;
}

/// @nodoc
class __$$CouponDisplayStateImplCopyWithImpl<$Res>
    extends _$CouponDisplayStateCopyWithImpl<$Res, _$CouponDisplayStateImpl>
    implements _$$CouponDisplayStateImplCopyWith<$Res> {
  __$$CouponDisplayStateImplCopyWithImpl(_$CouponDisplayStateImpl _value,
      $Res Function(_$CouponDisplayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupon = null,
    Object? isLoading = null,
  }) {
    return _then(_$CouponDisplayStateImpl(
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CouponDisplayStateImpl implements _CouponDisplayState {
  const _$CouponDisplayStateImpl(
      {required this.coupon, this.isLoading = false});

  @override
  final Coupon coupon;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CouponDisplayState(coupon: $coupon, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponDisplayStateImpl &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coupon, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponDisplayStateImplCopyWith<_$CouponDisplayStateImpl> get copyWith =>
      __$$CouponDisplayStateImplCopyWithImpl<_$CouponDisplayStateImpl>(
          this, _$identity);
}

abstract class _CouponDisplayState implements CouponDisplayState {
  const factory _CouponDisplayState(
      {required final Coupon coupon,
      final bool isLoading}) = _$CouponDisplayStateImpl;

  @override
  Coupon get coupon;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CouponDisplayStateImplCopyWith<_$CouponDisplayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
