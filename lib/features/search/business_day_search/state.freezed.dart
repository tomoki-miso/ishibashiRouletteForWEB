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
mixin _$BusinessDaySearchState {
  List<StoreClass> get searchResultIsBusinessDayStores =>
      throw _privateConstructorUsedError;
  List<StoreClass> get searchResultIsNotBusinessDayStores =>
      throw _privateConstructorUsedError;
  List<String> get selectedDays => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BusinessDaySearchStateCopyWith<BusinessDaySearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessDaySearchStateCopyWith<$Res> {
  factory $BusinessDaySearchStateCopyWith(BusinessDaySearchState value,
          $Res Function(BusinessDaySearchState) then) =
      _$BusinessDaySearchStateCopyWithImpl<$Res, BusinessDaySearchState>;
  @useResult
  $Res call(
      {List<StoreClass> searchResultIsBusinessDayStores,
      List<StoreClass> searchResultIsNotBusinessDayStores,
      List<String> selectedDays});
}

/// @nodoc
class _$BusinessDaySearchStateCopyWithImpl<$Res,
        $Val extends BusinessDaySearchState>
    implements $BusinessDaySearchStateCopyWith<$Res> {
  _$BusinessDaySearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResultIsBusinessDayStores = null,
    Object? searchResultIsNotBusinessDayStores = null,
    Object? selectedDays = null,
  }) {
    return _then(_value.copyWith(
      searchResultIsBusinessDayStores: null == searchResultIsBusinessDayStores
          ? _value.searchResultIsBusinessDayStores
          : searchResultIsBusinessDayStores // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      searchResultIsNotBusinessDayStores: null ==
              searchResultIsNotBusinessDayStores
          ? _value.searchResultIsNotBusinessDayStores
          : searchResultIsNotBusinessDayStores // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      selectedDays: null == selectedDays
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessDaySearchStateImplCopyWith<$Res>
    implements $BusinessDaySearchStateCopyWith<$Res> {
  factory _$$BusinessDaySearchStateImplCopyWith(
          _$BusinessDaySearchStateImpl value,
          $Res Function(_$BusinessDaySearchStateImpl) then) =
      __$$BusinessDaySearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StoreClass> searchResultIsBusinessDayStores,
      List<StoreClass> searchResultIsNotBusinessDayStores,
      List<String> selectedDays});
}

/// @nodoc
class __$$BusinessDaySearchStateImplCopyWithImpl<$Res>
    extends _$BusinessDaySearchStateCopyWithImpl<$Res,
        _$BusinessDaySearchStateImpl>
    implements _$$BusinessDaySearchStateImplCopyWith<$Res> {
  __$$BusinessDaySearchStateImplCopyWithImpl(
      _$BusinessDaySearchStateImpl _value,
      $Res Function(_$BusinessDaySearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResultIsBusinessDayStores = null,
    Object? searchResultIsNotBusinessDayStores = null,
    Object? selectedDays = null,
  }) {
    return _then(_$BusinessDaySearchStateImpl(
      searchResultIsBusinessDayStores: null == searchResultIsBusinessDayStores
          ? _value._searchResultIsBusinessDayStores
          : searchResultIsBusinessDayStores // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      searchResultIsNotBusinessDayStores: null ==
              searchResultIsNotBusinessDayStores
          ? _value._searchResultIsNotBusinessDayStores
          : searchResultIsNotBusinessDayStores // ignore: cast_nullable_to_non_nullable
              as List<StoreClass>,
      selectedDays: null == selectedDays
          ? _value._selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$BusinessDaySearchStateImpl implements _BusinessDaySearchState {
  const _$BusinessDaySearchStateImpl(
      {required final List<StoreClass> searchResultIsBusinessDayStores,
      required final List<StoreClass> searchResultIsNotBusinessDayStores,
      required final List<String> selectedDays})
      : _searchResultIsBusinessDayStores = searchResultIsBusinessDayStores,
        _searchResultIsNotBusinessDayStores =
            searchResultIsNotBusinessDayStores,
        _selectedDays = selectedDays;

  final List<StoreClass> _searchResultIsBusinessDayStores;
  @override
  List<StoreClass> get searchResultIsBusinessDayStores {
    if (_searchResultIsBusinessDayStores is EqualUnmodifiableListView)
      return _searchResultIsBusinessDayStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResultIsBusinessDayStores);
  }

  final List<StoreClass> _searchResultIsNotBusinessDayStores;
  @override
  List<StoreClass> get searchResultIsNotBusinessDayStores {
    if (_searchResultIsNotBusinessDayStores is EqualUnmodifiableListView)
      return _searchResultIsNotBusinessDayStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResultIsNotBusinessDayStores);
  }

  final List<String> _selectedDays;
  @override
  List<String> get selectedDays {
    if (_selectedDays is EqualUnmodifiableListView) return _selectedDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedDays);
  }

  @override
  String toString() {
    return 'BusinessDaySearchState(searchResultIsBusinessDayStores: $searchResultIsBusinessDayStores, searchResultIsNotBusinessDayStores: $searchResultIsNotBusinessDayStores, selectedDays: $selectedDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessDaySearchStateImpl &&
            const DeepCollectionEquality().equals(
                other._searchResultIsBusinessDayStores,
                _searchResultIsBusinessDayStores) &&
            const DeepCollectionEquality().equals(
                other._searchResultIsNotBusinessDayStores,
                _searchResultIsNotBusinessDayStores) &&
            const DeepCollectionEquality()
                .equals(other._selectedDays, _selectedDays));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchResultIsBusinessDayStores),
      const DeepCollectionEquality().hash(_searchResultIsNotBusinessDayStores),
      const DeepCollectionEquality().hash(_selectedDays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessDaySearchStateImplCopyWith<_$BusinessDaySearchStateImpl>
      get copyWith => __$$BusinessDaySearchStateImplCopyWithImpl<
          _$BusinessDaySearchStateImpl>(this, _$identity);
}

abstract class _BusinessDaySearchState implements BusinessDaySearchState {
  const factory _BusinessDaySearchState(
      {required final List<StoreClass> searchResultIsBusinessDayStores,
      required final List<StoreClass> searchResultIsNotBusinessDayStores,
      required final List<String> selectedDays}) = _$BusinessDaySearchStateImpl;

  @override
  List<StoreClass> get searchResultIsBusinessDayStores;
  @override
  List<StoreClass> get searchResultIsNotBusinessDayStores;
  @override
  List<String> get selectedDays;
  @override
  @JsonKey(ignore: true)
  _$$BusinessDaySearchStateImplCopyWith<_$BusinessDaySearchStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
