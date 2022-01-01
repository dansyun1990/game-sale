// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
class _$ReviewTearOff {
  const _$ReviewTearOff();

  _Review call(
      {String? id,
      required String userId,
      required String userName,
      required String content,
      required List<String> like,
      @TimestampConverter() required DateTime createdAt}) {
    return _Review(
      id: id,
      userId: userId,
      userName: userName,
      content: content,
      like: like,
      createdAt: createdAt,
    );
  }

  Review fromJson(Map<String, Object?> json) {
    return Review.fromJson(json);
  }
}

/// @nodoc
const $Review = _$ReviewTearOff();

/// @nodoc
mixin _$Review {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get like => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String userId,
      String userName,
      String content,
      List<String> like,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res> implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  final Review _value;
  // ignore: unused_field
  final $Res Function(Review) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? content = freezed,
    Object? like = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) then) =
      __$ReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String userId,
      String userName,
      String content,
      List<String> like,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$ReviewCopyWithImpl<$Res> extends _$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(_Review _value, $Res Function(_Review) _then)
      : super(_value, (v) => _then(v as _Review));

  @override
  _Review get _value => super._value as _Review;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? content = freezed,
    Object? like = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Review(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Review implements _Review {
  const _$_Review(
      {this.id,
      required this.userId,
      required this.userName,
      required this.content,
      required this.like,
      @TimestampConverter() required this.createdAt});

  factory _$_Review.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String content;
  @override
  final List<String> like;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'Review(id: $id, userId: $userId, userName: $userName, content: $content, like: $like, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Review &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.like, like) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(like),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ReviewCopyWith<_Review> get copyWith =>
      __$ReviewCopyWithImpl<_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewToJson(this);
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {String? id,
      required String userId,
      required String userName,
      required String content,
      required List<String> like,
      @TimestampConverter() required DateTime createdAt}) = _$_Review;

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get content;
  @override
  List<String> get like;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ReviewCopyWith<_Review> get copyWith => throw _privateConstructorUsedError;
}
