// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return _Coupon.fromJson(json);
}

/// @nodoc
mixin _$Coupon {
  String get couponId => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get couponName => throw _privateConstructorUsedError;
  String get couponDetail => throw _privateConstructorUsedError;
  String get couponImage => throw _privateConstructorUsedError;
  String get expiration => throw _privateConstructorUsedError;
  int? get remainingAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
  @useResult
  $Res call(
      {String couponId,
      String storeId,
      String storeName,
      String couponName,
      String couponDetail,
      String couponImage,
      String expiration,
      int? remainingAmount});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponId = null,
    Object? storeId = null,
    Object? storeName = null,
    Object? couponName = null,
    Object? couponDetail = null,
    Object? couponImage = null,
    Object? expiration = null,
    Object? remainingAmount = freezed,
  }) {
    return _then(_value.copyWith(
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      couponName: null == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String,
      couponDetail: null == couponDetail
          ? _value.couponDetail
          : couponDetail // ignore: cast_nullable_to_non_nullable
              as String,
      couponImage: null == couponImage
          ? _value.couponImage
          : couponImage // ignore: cast_nullable_to_non_nullable
              as String,
      expiration: null == expiration
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as String,
      remainingAmount: freezed == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponImplCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$CouponImplCopyWith(
          _$CouponImpl value, $Res Function(_$CouponImpl) then) =
      __$$CouponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String couponId,
      String storeId,
      String storeName,
      String couponName,
      String couponDetail,
      String couponImage,
      String expiration,
      int? remainingAmount});
}

/// @nodoc
class __$$CouponImplCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$CouponImpl>
    implements _$$CouponImplCopyWith<$Res> {
  __$$CouponImplCopyWithImpl(
      _$CouponImpl _value, $Res Function(_$CouponImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponId = null,
    Object? storeId = null,
    Object? storeName = null,
    Object? couponName = null,
    Object? couponDetail = null,
    Object? couponImage = null,
    Object? expiration = null,
    Object? remainingAmount = freezed,
  }) {
    return _then(_$CouponImpl(
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      couponName: null == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String,
      couponDetail: null == couponDetail
          ? _value.couponDetail
          : couponDetail // ignore: cast_nullable_to_non_nullable
              as String,
      couponImage: null == couponImage
          ? _value.couponImage
          : couponImage // ignore: cast_nullable_to_non_nullable
              as String,
      expiration: null == expiration
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as String,
      remainingAmount: freezed == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponImpl implements _Coupon {
  const _$CouponImpl(
      {required this.couponId,
      required this.storeId,
      required this.storeName,
      required this.couponName,
      required this.couponDetail,
      required this.couponImage,
      required this.expiration,
      this.remainingAmount});

  factory _$CouponImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponImplFromJson(json);

  @override
  final String couponId;
  @override
  final String storeId;
  @override
  final String storeName;
  @override
  final String couponName;
  @override
  final String couponDetail;
  @override
  final String couponImage;
  @override
  final String expiration;
  @override
  final int? remainingAmount;

  @override
  String toString() {
    return 'Coupon(couponId: $couponId, storeId: $storeId, storeName: $storeName, couponName: $couponName, couponDetail: $couponDetail, couponImage: $couponImage, expiration: $expiration, remainingAmount: $remainingAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponImpl &&
            (identical(other.couponId, couponId) ||
                other.couponId == couponId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.couponName, couponName) ||
                other.couponName == couponName) &&
            (identical(other.couponDetail, couponDetail) ||
                other.couponDetail == couponDetail) &&
            (identical(other.couponImage, couponImage) ||
                other.couponImage == couponImage) &&
            (identical(other.expiration, expiration) ||
                other.expiration == expiration) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, couponId, storeId, storeName,
      couponName, couponDetail, couponImage, expiration, remainingAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      __$$CouponImplCopyWithImpl<_$CouponImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponImplToJson(
      this,
    );
  }
}

abstract class _Coupon implements Coupon {
  const factory _Coupon(
      {required final String couponId,
      required final String storeId,
      required final String storeName,
      required final String couponName,
      required final String couponDetail,
      required final String couponImage,
      required final String expiration,
      final int? remainingAmount}) = _$CouponImpl;

  factory _Coupon.fromJson(Map<String, dynamic> json) = _$CouponImpl.fromJson;

  @override
  String get couponId;
  @override
  String get storeId;
  @override
  String get storeName;
  @override
  String get couponName;
  @override
  String get couponDetail;
  @override
  String get couponImage;
  @override
  String get expiration;
  @override
  int? get remainingAmount;
  @override
  @JsonKey(ignore: true)
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
