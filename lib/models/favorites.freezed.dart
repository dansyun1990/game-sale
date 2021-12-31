// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavoritesTearOff {
  const _$FavoritesTearOff();

  _Favorites call(
      {required List<Game> games,
      required List<Favorite> favorites,
      bool isLoading = false,
      bool hasMore = false}) {
    return _Favorites(
      games: games,
      favorites: favorites,
      isLoading: isLoading,
      hasMore: hasMore,
    );
  }
}

/// @nodoc
const $Favorites = _$FavoritesTearOff();

/// @nodoc
mixin _$Favorites {
  List<Game> get games => throw _privateConstructorUsedError;
  List<Favorite> get favorites => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesCopyWith<Favorites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesCopyWith<$Res> {
  factory $FavoritesCopyWith(Favorites value, $Res Function(Favorites) then) =
      _$FavoritesCopyWithImpl<$Res>;
  $Res call(
      {List<Game> games,
      List<Favorite> favorites,
      bool isLoading,
      bool hasMore});
}

/// @nodoc
class _$FavoritesCopyWithImpl<$Res> implements $FavoritesCopyWith<$Res> {
  _$FavoritesCopyWithImpl(this._value, this._then);

  final Favorites _value;
  // ignore: unused_field
  final $Res Function(Favorites) _then;

  @override
  $Res call({
    Object? games = freezed,
    Object? favorites = freezed,
    Object? isLoading = freezed,
    Object? hasMore = freezed,
  }) {
    return _then(_value.copyWith(
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Favorite>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: hasMore == freezed
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FavoritesCopyWith<$Res> implements $FavoritesCopyWith<$Res> {
  factory _$FavoritesCopyWith(
          _Favorites value, $Res Function(_Favorites) then) =
      __$FavoritesCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Game> games,
      List<Favorite> favorites,
      bool isLoading,
      bool hasMore});
}

/// @nodoc
class __$FavoritesCopyWithImpl<$Res> extends _$FavoritesCopyWithImpl<$Res>
    implements _$FavoritesCopyWith<$Res> {
  __$FavoritesCopyWithImpl(_Favorites _value, $Res Function(_Favorites) _then)
      : super(_value, (v) => _then(v as _Favorites));

  @override
  _Favorites get _value => super._value as _Favorites;

  @override
  $Res call({
    Object? games = freezed,
    Object? favorites = freezed,
    Object? isLoading = freezed,
    Object? hasMore = freezed,
  }) {
    return _then(_Favorites(
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Favorite>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: hasMore == freezed
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Favorites implements _Favorites {
  const _$_Favorites(
      {required this.games,
      required this.favorites,
      this.isLoading = false,
      this.hasMore = false});

  @override
  final List<Game> games;
  @override
  final List<Favorite> favorites;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'Favorites(games: $games, favorites: $favorites, isLoading: $isLoading, hasMore: $hasMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Favorites &&
            const DeepCollectionEquality().equals(other.games, games) &&
            const DeepCollectionEquality().equals(other.favorites, favorites) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(games),
      const DeepCollectionEquality().hash(favorites),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasMore));

  @JsonKey(ignore: true)
  @override
  _$FavoritesCopyWith<_Favorites> get copyWith =>
      __$FavoritesCopyWithImpl<_Favorites>(this, _$identity);
}

abstract class _Favorites implements Favorites {
  const factory _Favorites(
      {required List<Game> games,
      required List<Favorite> favorites,
      bool isLoading,
      bool hasMore}) = _$_Favorites;

  @override
  List<Game> get games;
  @override
  List<Favorite> get favorites;
  @override
  bool get isLoading;
  @override
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$FavoritesCopyWith<_Favorites> get copyWith =>
      throw _privateConstructorUsedError;
}
