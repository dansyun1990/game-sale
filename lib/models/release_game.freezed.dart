// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'release_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReleaseGame _$ReleaseGameFromJson(Map<String, dynamic> json) {
  return _ReleaseGame.fromJson(json);
}

/// @nodoc
class _$ReleaseGameTearOff {
  const _$ReleaseGameTearOff();

  _ReleaseGame call(
      {String? id,
      required String name,
      required String platform,
      required String coverArt,
      required List<String> genre,
      int? basePrice,
      required String releaseDate}) {
    return _ReleaseGame(
      id: id,
      name: name,
      platform: platform,
      coverArt: coverArt,
      genre: genre,
      basePrice: basePrice,
      releaseDate: releaseDate,
    );
  }

  ReleaseGame fromJson(Map<String, Object?> json) {
    return ReleaseGame.fromJson(json);
  }
}

/// @nodoc
const $ReleaseGame = _$ReleaseGameTearOff();

/// @nodoc
mixin _$ReleaseGame {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get coverArt => throw _privateConstructorUsedError;
  List<String> get genre => throw _privateConstructorUsedError;
  int? get basePrice => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReleaseGameCopyWith<ReleaseGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseGameCopyWith<$Res> {
  factory $ReleaseGameCopyWith(
          ReleaseGame value, $Res Function(ReleaseGame) then) =
      _$ReleaseGameCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String platform,
      String coverArt,
      List<String> genre,
      int? basePrice,
      String releaseDate});
}

/// @nodoc
class _$ReleaseGameCopyWithImpl<$Res> implements $ReleaseGameCopyWith<$Res> {
  _$ReleaseGameCopyWithImpl(this._value, this._then);

  final ReleaseGame _value;
  // ignore: unused_field
  final $Res Function(ReleaseGame) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? platform = freezed,
    Object? coverArt = freezed,
    Object? genre = freezed,
    Object? basePrice = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      coverArt: coverArt == freezed
          ? _value.coverArt
          : coverArt // ignore: cast_nullable_to_non_nullable
              as String,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>,
      basePrice: basePrice == freezed
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReleaseGameCopyWith<$Res>
    implements $ReleaseGameCopyWith<$Res> {
  factory _$ReleaseGameCopyWith(
          _ReleaseGame value, $Res Function(_ReleaseGame) then) =
      __$ReleaseGameCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String platform,
      String coverArt,
      List<String> genre,
      int? basePrice,
      String releaseDate});
}

/// @nodoc
class __$ReleaseGameCopyWithImpl<$Res> extends _$ReleaseGameCopyWithImpl<$Res>
    implements _$ReleaseGameCopyWith<$Res> {
  __$ReleaseGameCopyWithImpl(
      _ReleaseGame _value, $Res Function(_ReleaseGame) _then)
      : super(_value, (v) => _then(v as _ReleaseGame));

  @override
  _ReleaseGame get _value => super._value as _ReleaseGame;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? platform = freezed,
    Object? coverArt = freezed,
    Object? genre = freezed,
    Object? basePrice = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_ReleaseGame(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      coverArt: coverArt == freezed
          ? _value.coverArt
          : coverArt // ignore: cast_nullable_to_non_nullable
              as String,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>,
      basePrice: basePrice == freezed
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReleaseGame implements _ReleaseGame {
  const _$_ReleaseGame(
      {this.id,
      required this.name,
      required this.platform,
      required this.coverArt,
      required this.genre,
      this.basePrice,
      required this.releaseDate});

  factory _$_ReleaseGame.fromJson(Map<String, dynamic> json) =>
      _$$_ReleaseGameFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String platform;
  @override
  final String coverArt;
  @override
  final List<String> genre;
  @override
  final int? basePrice;
  @override
  final String releaseDate;

  @override
  String toString() {
    return 'ReleaseGame(id: $id, name: $name, platform: $platform, coverArt: $coverArt, genre: $genre, basePrice: $basePrice, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReleaseGame &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.coverArt, coverArt) &&
            const DeepCollectionEquality().equals(other.genre, genre) &&
            const DeepCollectionEquality().equals(other.basePrice, basePrice) &&
            const DeepCollectionEquality()
                .equals(other.releaseDate, releaseDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(coverArt),
      const DeepCollectionEquality().hash(genre),
      const DeepCollectionEquality().hash(basePrice),
      const DeepCollectionEquality().hash(releaseDate));

  @JsonKey(ignore: true)
  @override
  _$ReleaseGameCopyWith<_ReleaseGame> get copyWith =>
      __$ReleaseGameCopyWithImpl<_ReleaseGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReleaseGameToJson(this);
  }
}

abstract class _ReleaseGame implements ReleaseGame {
  const factory _ReleaseGame(
      {String? id,
      required String name,
      required String platform,
      required String coverArt,
      required List<String> genre,
      int? basePrice,
      required String releaseDate}) = _$_ReleaseGame;

  factory _ReleaseGame.fromJson(Map<String, dynamic> json) =
      _$_ReleaseGame.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get platform;
  @override
  String get coverArt;
  @override
  List<String> get genre;
  @override
  int? get basePrice;
  @override
  String get releaseDate;
  @override
  @JsonKey(ignore: true)
  _$ReleaseGameCopyWith<_ReleaseGame> get copyWith =>
      throw _privateConstructorUsedError;
}
