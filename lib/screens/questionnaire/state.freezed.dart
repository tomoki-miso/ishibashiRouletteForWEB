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
mixin _$QuestionnaireState {
  TextEditingController get userNameController =>
      throw _privateConstructorUsedError;
  String get selectedGender => throw _privateConstructorUsedError;
  String get selectedOccupation => throw _privateConstructorUsedError;
  Map<String, String> get dropDownGenderMap =>
      throw _privateConstructorUsedError;
  Map<String, String> get dropDownOccupationMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionnaireStateCopyWith<QuestionnaireState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnaireStateCopyWith<$Res> {
  factory $QuestionnaireStateCopyWith(
          QuestionnaireState value, $Res Function(QuestionnaireState) then) =
      _$QuestionnaireStateCopyWithImpl<$Res, QuestionnaireState>;
  @useResult
  $Res call(
      {TextEditingController userNameController,
      String selectedGender,
      String selectedOccupation,
      Map<String, String> dropDownGenderMap,
      Map<String, String> dropDownOccupationMap});
}

/// @nodoc
class _$QuestionnaireStateCopyWithImpl<$Res, $Val extends QuestionnaireState>
    implements $QuestionnaireStateCopyWith<$Res> {
  _$QuestionnaireStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNameController = null,
    Object? selectedGender = null,
    Object? selectedOccupation = null,
    Object? dropDownGenderMap = null,
    Object? dropDownOccupationMap = null,
  }) {
    return _then(_value.copyWith(
      userNameController: null == userNameController
          ? _value.userNameController
          : userNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      selectedGender: null == selectedGender
          ? _value.selectedGender
          : selectedGender // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOccupation: null == selectedOccupation
          ? _value.selectedOccupation
          : selectedOccupation // ignore: cast_nullable_to_non_nullable
              as String,
      dropDownGenderMap: null == dropDownGenderMap
          ? _value.dropDownGenderMap
          : dropDownGenderMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      dropDownOccupationMap: null == dropDownOccupationMap
          ? _value.dropDownOccupationMap
          : dropDownOccupationMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionnaireStateImplCopyWith<$Res>
    implements $QuestionnaireStateCopyWith<$Res> {
  factory _$$QuestionnaireStateImplCopyWith(_$QuestionnaireStateImpl value,
          $Res Function(_$QuestionnaireStateImpl) then) =
      __$$QuestionnaireStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController userNameController,
      String selectedGender,
      String selectedOccupation,
      Map<String, String> dropDownGenderMap,
      Map<String, String> dropDownOccupationMap});
}

/// @nodoc
class __$$QuestionnaireStateImplCopyWithImpl<$Res>
    extends _$QuestionnaireStateCopyWithImpl<$Res, _$QuestionnaireStateImpl>
    implements _$$QuestionnaireStateImplCopyWith<$Res> {
  __$$QuestionnaireStateImplCopyWithImpl(_$QuestionnaireStateImpl _value,
      $Res Function(_$QuestionnaireStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNameController = null,
    Object? selectedGender = null,
    Object? selectedOccupation = null,
    Object? dropDownGenderMap = null,
    Object? dropDownOccupationMap = null,
  }) {
    return _then(_$QuestionnaireStateImpl(
      userNameController: null == userNameController
          ? _value.userNameController
          : userNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      selectedGender: null == selectedGender
          ? _value.selectedGender
          : selectedGender // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOccupation: null == selectedOccupation
          ? _value.selectedOccupation
          : selectedOccupation // ignore: cast_nullable_to_non_nullable
              as String,
      dropDownGenderMap: null == dropDownGenderMap
          ? _value._dropDownGenderMap
          : dropDownGenderMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      dropDownOccupationMap: null == dropDownOccupationMap
          ? _value._dropDownOccupationMap
          : dropDownOccupationMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$QuestionnaireStateImpl implements _QuestionnaireState {
  const _$QuestionnaireStateImpl(
      {required this.userNameController,
      required this.selectedGender,
      required this.selectedOccupation,
      required final Map<String, String> dropDownGenderMap,
      required final Map<String, String> dropDownOccupationMap})
      : _dropDownGenderMap = dropDownGenderMap,
        _dropDownOccupationMap = dropDownOccupationMap;

  @override
  final TextEditingController userNameController;
  @override
  final String selectedGender;
  @override
  final String selectedOccupation;
  final Map<String, String> _dropDownGenderMap;
  @override
  Map<String, String> get dropDownGenderMap {
    if (_dropDownGenderMap is EqualUnmodifiableMapView)
      return _dropDownGenderMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dropDownGenderMap);
  }

  final Map<String, String> _dropDownOccupationMap;
  @override
  Map<String, String> get dropDownOccupationMap {
    if (_dropDownOccupationMap is EqualUnmodifiableMapView)
      return _dropDownOccupationMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dropDownOccupationMap);
  }

  @override
  String toString() {
    return 'QuestionnaireState(userNameController: $userNameController, selectedGender: $selectedGender, selectedOccupation: $selectedOccupation, dropDownGenderMap: $dropDownGenderMap, dropDownOccupationMap: $dropDownOccupationMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionnaireStateImpl &&
            (identical(other.userNameController, userNameController) ||
                other.userNameController == userNameController) &&
            (identical(other.selectedGender, selectedGender) ||
                other.selectedGender == selectedGender) &&
            (identical(other.selectedOccupation, selectedOccupation) ||
                other.selectedOccupation == selectedOccupation) &&
            const DeepCollectionEquality()
                .equals(other._dropDownGenderMap, _dropDownGenderMap) &&
            const DeepCollectionEquality()
                .equals(other._dropDownOccupationMap, _dropDownOccupationMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userNameController,
      selectedGender,
      selectedOccupation,
      const DeepCollectionEquality().hash(_dropDownGenderMap),
      const DeepCollectionEquality().hash(_dropDownOccupationMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionnaireStateImplCopyWith<_$QuestionnaireStateImpl> get copyWith =>
      __$$QuestionnaireStateImplCopyWithImpl<_$QuestionnaireStateImpl>(
          this, _$identity);
}

abstract class _QuestionnaireState implements QuestionnaireState {
  const factory _QuestionnaireState(
          {required final TextEditingController userNameController,
          required final String selectedGender,
          required final String selectedOccupation,
          required final Map<String, String> dropDownGenderMap,
          required final Map<String, String> dropDownOccupationMap}) =
      _$QuestionnaireStateImpl;

  @override
  TextEditingController get userNameController;
  @override
  String get selectedGender;
  @override
  String get selectedOccupation;
  @override
  Map<String, String> get dropDownGenderMap;
  @override
  Map<String, String> get dropDownOccupationMap;
  @override
  @JsonKey(ignore: true)
  _$$QuestionnaireStateImplCopyWith<_$QuestionnaireStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
