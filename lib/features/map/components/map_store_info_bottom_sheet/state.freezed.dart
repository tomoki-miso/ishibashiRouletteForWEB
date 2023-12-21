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
mixin _$MapStoreInfoState {
  StoreClass get storeClass => throw _privateConstructorUsedError;
  String get testText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStoreInfoStateCopyWith<MapStoreInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStoreInfoStateCopyWith<$Res> {
  factory $MapStoreInfoStateCopyWith(
          MapStoreInfoState value, $Res Function(MapStoreInfoState) then) =
      _$MapStoreInfoStateCopyWithImpl<$Res, MapStoreInfoState>;
  @useResult
  $Res call({StoreClass storeClass, String testText});

  $StoreClassCopyWith<$Res> get storeClass;
}

/// @nodoc
class _$MapStoreInfoStateCopyWithImpl<$Res, $Val extends MapStoreInfoState>
    implements $MapStoreInfoStateCopyWith<$Res> {
  _$MapStoreInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeClass = null,
    Object? testText = null,
  }) {
    return _then(_value.copyWith(
      storeClass: null == storeClass
          ? _value.storeClass
          : storeClass // ignore: cast_nullable_to_non_nullable
              as StoreClass,
      testText: null == testText
          ? _value.testText
          : testText // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$MapStoreInfoStateImplCopyWith<$Res>
    implements $MapStoreInfoStateCopyWith<$Res> {
  factory _$$MapStoreInfoStateImplCopyWith(_$MapStoreInfoStateImpl value,
          $Res Function(_$MapStoreInfoStateImpl) then) =
      __$$MapStoreInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreClass storeClass, String testText});

  @override
  $StoreClassCopyWith<$Res> get storeClass;
}

/// @nodoc
class __$$MapStoreInfoStateImplCopyWithImpl<$Res>
    extends _$MapStoreInfoStateCopyWithImpl<$Res, _$MapStoreInfoStateImpl>
    implements _$$MapStoreInfoStateImplCopyWith<$Res> {
  __$$MapStoreInfoStateImplCopyWithImpl(_$MapStoreInfoStateImpl _value,
      $Res Function(_$MapStoreInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeClass = null,
    Object? testText = null,
  }) {
    return _then(_$MapStoreInfoStateImpl(
      storeClass: null == storeClass
          ? _value.storeClass
          : storeClass // ignore: cast_nullable_to_non_nullable
              as StoreClass,
      testText: null == testText
          ? _value.testText
          : testText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MapStoreInfoStateImpl implements _MapStoreInfoState {
  const _$MapStoreInfoStateImpl(
      {required this.storeClass, required this.testText});

  @override
  final StoreClass storeClass;
  @override
  final String testText;

  @override
  String toString() {
    return 'MapStoreInfoState(storeClass: $storeClass, testText: $testText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStoreInfoStateImpl &&
            (identical(other.storeClass, storeClass) ||
                other.storeClass == storeClass) &&
            (identical(other.testText, testText) ||
                other.testText == testText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeClass, testText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStoreInfoStateImplCopyWith<_$MapStoreInfoStateImpl> get copyWith =>
      __$$MapStoreInfoStateImplCopyWithImpl<_$MapStoreInfoStateImpl>(
          this, _$identity);
}

abstract class _MapStoreInfoState implements MapStoreInfoState {
  const factory _MapStoreInfoState(
      {required final StoreClass storeClass,
      required final String testText}) = _$MapStoreInfoStateImpl;

  @override
  StoreClass get storeClass;
  @override
  String get testText;
  @override
  @JsonKey(ignore: true)
  _$$MapStoreInfoStateImplCopyWith<_$MapStoreInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
