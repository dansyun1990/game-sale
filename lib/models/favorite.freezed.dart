// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
class _$FavoriteTearOff {
  const _$FavoriteTearOff();

  _Favorite call(
      {required String id,
      required int notificationType,
      @TimestampConverter() required DateTime createdAt}) {
    return _Favorite(
      id: id,
      notificationType: notificationType,
      createdAt: createdAt,
    );
  }

  Favorite fromJson(Map<String, Object?> json) {
    return Favorite.fromJson(json);
  }
}

/// @nodoc
const $Favorite = _$FavoriteTearOff();

/// @nodoc
mixin _$Favorite {
  String get id => throw _privateConstructorUsedError;
  int get notificationType => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res>;
  $Res call(
      {String id,
      int notificationType,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res> implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  final Favorite _value;
  // ignore: unused_field
  final $Res Function(Favorite) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? notificationType = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$FavoriteCopyWith(_Favorite value, $Res Function(_Favorite) then) =
      __$FavoriteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      int notificationType,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$FavoriteCopyWithImpl<$Res> extends _$FavoriteCopyWithImpl<$Res>
    implements _$FavoriteCopyWith<$Res> {
  __$FavoriteCopyWithImpl(_Favorite _value, $Res Function(_Favorite) _then)
      : super(_value, (v) => _then(v as _Favorite));

  @override
  _Favorite get _value => super._value as _Favorite;

  @override
  $Res call({
    Object? id = freezed,
    Object? notificationType = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Favorite(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Favorite implements _Favorite {
  const _$_Favorite(
      {required this.id,
      required this.notificationType,
      @TimestampConverter() required this.createdAt});

  factory _$_Favorite.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteFromJson(json);

  @override
  final String id;
  @override
  final int notificationType;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'Favorite(id: $id, notificationType: $notificationType, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Favorite &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.notificationType, notificationType) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(notificationType),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$FavoriteCopyWith<_Favorite> get copyWith =>
      __$FavoriteCopyWithImpl<_Favorite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteToJson(this);
  }
}

abstract class _Favorite implements Favorite {
  const factory _Favorite(
      {required String id,
      required int notificationType,
      @TimestampConverter() required DateTime createdAt}) = _$_Favorite;

  factory _Favorite.fromJson(Map<String, dynamic> json) = _$_Favorite.fromJson;

  @override
  String get id;
  @override
  int get notificationType;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$FavoriteCopyWith<_Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}
