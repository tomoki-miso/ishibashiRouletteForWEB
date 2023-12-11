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
mixin _$OwnedCouponListState {
  List<dynamic> get couponList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OwnedCouponListStateCopyWith<OwnedCouponListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnedCouponListStateCopyWith<$Res> {
  factory $OwnedCouponListStateCopyWith(OwnedCouponListState value,
          $Res Function(OwnedCouponListState) then) =
      _$OwnedCouponListStateCopyWithImpl<$Res, OwnedCouponListState>;
  @useResult
  $Res call({List<dynamic> couponList, bool isLoading});
}

/// @nodoc
class _$OwnedCouponListStateCopyWithImpl<$Res,
        $Val extends OwnedCouponListState>
    implements $OwnedCouponListStateCopyWith<$Res> {
  _$OwnedCouponListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponList = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      couponList: null == couponList
          ? _value.couponList
          : couponList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnedCouponListStateImplCopyWith<$Res>
    implements $OwnedCouponListStateCopyWith<$Res> {
  factory _$$OwnedCouponListStateImplCopyWith(_$OwnedCouponListStateImpl value,
          $Res Function(_$OwnedCouponListStateImpl) then) =
      __$$OwnedCouponListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> couponList, bool isLoading});
}

/// @nodoc
class __$$OwnedCouponListStateImplCopyWithImpl<$Res>
    extends _$OwnedCouponListStateCopyWithImpl<$Res, _$OwnedCouponListStateImpl>
    implements _$$OwnedCouponListStateImplCopyWith<$Res> {
  __$$OwnedCouponListStateImplCopyWithImpl(_$OwnedCouponListStateImpl _value,
      $Res Function(_$OwnedCouponListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponList = null,
    Object? isLoading = null,
  }) {
    return _then(_$OwnedCouponListStateImpl(
      couponList: null == couponList
          ? _value._couponList
          : couponList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OwnedCouponListStateImpl implements _OwnedCouponListState {
  const _$OwnedCouponListStateImpl(
      {required final List<dynamic> couponList, this.isLoading = false})
      : _couponList = couponList;

  final List<dynamic> _couponList;
  @override
  List<dynamic> get couponList {
    if (_couponList is EqualUnmodifiableListView) return _couponList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_couponList);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'OwnedCouponListState(couponList: $couponList, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnedCouponListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._couponList, _couponList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_couponList), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnedCouponListStateImplCopyWith<_$OwnedCouponListStateImpl>
      get copyWith =>
          __$$OwnedCouponListStateImplCopyWithImpl<_$OwnedCouponListStateImpl>(
              this, _$identity);
}

abstract class _OwnedCouponListState implements OwnedCouponListState {
  const factory _OwnedCouponListState(
      {required final List<dynamic> couponList,
      final bool isLoading}) = _$OwnedCouponListStateImpl;

  @override
  List<dynamic> get couponList;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$OwnedCouponListStateImplCopyWith<_$OwnedCouponListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
