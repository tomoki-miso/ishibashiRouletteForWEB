// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoClass _$UserInfoClassFromJson(Map<String, dynamic> json) {
  return _UserInfoClass.fromJson(json);
}

/// @nodoc
mixin _$UserInfoClass {
  String get userId => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get occupation => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get faculty => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoClassCopyWith<UserInfoClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoClassCopyWith<$Res> {
  factory $UserInfoClassCopyWith(
          UserInfoClass value, $Res Function(UserInfoClass) then) =
      _$UserInfoClassCopyWithImpl<$Res, UserInfoClass>;
  @useResult
  $Res call(
      {String userId,
      String gender,
      String occupation,
      String userName,
      String? faculty,
      String? department,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$UserInfoClassCopyWithImpl<$Res, $Val extends UserInfoClass>
    implements $UserInfoClassCopyWith<$Res> {
  _$UserInfoClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? gender = null,
    Object? occupation = null,
    Object? userName = null,
    Object? faculty = freezed,
    Object? department = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      faculty: freezed == faculty
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoClassImplCopyWith<$Res>
    implements $UserInfoClassCopyWith<$Res> {
  factory _$$UserInfoClassImplCopyWith(
          _$UserInfoClassImpl value, $Res Function(_$UserInfoClassImpl) then) =
      __$$UserInfoClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String gender,
      String occupation,
      String userName,
      String? faculty,
      String? department,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$UserInfoClassImplCopyWithImpl<$Res>
    extends _$UserInfoClassCopyWithImpl<$Res, _$UserInfoClassImpl>
    implements _$$UserInfoClassImplCopyWith<$Res> {
  __$$UserInfoClassImplCopyWithImpl(
      _$UserInfoClassImpl _value, $Res Function(_$UserInfoClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? gender = null,
    Object? occupation = null,
    Object? userName = null,
    Object? faculty = freezed,
    Object? department = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserInfoClassImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      faculty: freezed == faculty
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoClassImpl implements _UserInfoClass {
  const _$UserInfoClassImpl(
      {required this.userId,
      required this.gender,
      required this.occupation,
      required this.userName,
      this.faculty,
      this.department,
      this.createdAt,
      this.updatedAt});

  factory _$UserInfoClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoClassImplFromJson(json);

  @override
  final String userId;
  @override
  final String gender;
  @override
  final String occupation;
  @override
  final String userName;
  @override
  final String? faculty;
  @override
  final String? department;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserInfoClass(userId: $userId, gender: $gender, occupation: $occupation, userName: $userName, faculty: $faculty, department: $department, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoClassImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.faculty, faculty) || other.faculty == faculty) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, gender, occupation,
      userName, faculty, department, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoClassImplCopyWith<_$UserInfoClassImpl> get copyWith =>
      __$$UserInfoClassImplCopyWithImpl<_$UserInfoClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoClassImplToJson(
      this,
    );
  }
}

abstract class _UserInfoClass implements UserInfoClass {
  const factory _UserInfoClass(
      {required final String userId,
      required final String gender,
      required final String occupation,
      required final String userName,
      final String? faculty,
      final String? department,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$UserInfoClassImpl;

  factory _UserInfoClass.fromJson(Map<String, dynamic> json) =
      _$UserInfoClassImpl.fromJson;

  @override
  String get userId;
  @override
  String get gender;
  @override
  String get occupation;
  @override
  String get userName;
  @override
  String? get faculty;
  @override
  String? get department;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoClassImplCopyWith<_$UserInfoClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
