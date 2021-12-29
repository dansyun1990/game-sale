// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'games.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GamesTearOff {
  const _$GamesTearOff();

  _Games call(
      {required List<Game> games,
      bool isLoading = false,
      bool hasMore = false}) {
    return _Games(
      games: games,
      isLoading: isLoading,
      hasMore: hasMore,
    );
  }
}

/// @nodoc
const $Games = _$GamesTearOff();

/// @nodoc
mixin _$Games {
  List<Game> get games => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GamesCopyWith<Games> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamesCopyWith<$Res> {
  factory $GamesCopyWith(Games value, $Res Function(Games) then) =
      _$GamesCopyWithImpl<$Res>;
  $Res call({List<Game> games, bool isLoading, bool hasMore});
}

/// @nodoc
class _$GamesCopyWithImpl<$Res> implements $GamesCopyWith<$Res> {
  _$GamesCopyWithImpl(this._value, this._then);

  final Games _value;
  // ignore: unused_field
  final $Res Function(Games) _then;

  @override
  $Res call({
    Object? games = freezed,
    Object? isLoading = freezed,
    Object? hasMore = freezed,
  }) {
    return _then(_value.copyWith(
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
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
abstract class _$GamesCopyWith<$Res> implements $GamesCopyWith<$Res> {
  factory _$GamesCopyWith(_Games value, $Res Function(_Games) then) =
      __$GamesCopyWithImpl<$Res>;
  @override
  $Res call({List<Game> games, bool isLoading, bool hasMore});
}

/// @nodoc
class __$GamesCopyWithImpl<$Res> extends _$GamesCopyWithImpl<$Res>
    implements _$GamesCopyWith<$Res> {
  __$GamesCopyWithImpl(_Games _value, $Res Function(_Games) _then)
      : super(_value, (v) => _then(v as _Games));

  @override
  _Games get _value => super._value as _Games;

  @override
  $Res call({
    Object? games = freezed,
    Object? isLoading = freezed,
    Object? hasMore = freezed,
  }) {
    return _then(_Games(
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
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

class _$_Games implements _Games {
  const _$_Games(
      {required this.games, this.isLoading = false, this.hasMore = false});

  @override
  final List<Game> games;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'Games(games: $games, isLoading: $isLoading, hasMore: $hasMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Games &&
            const DeepCollectionEquality().equals(other.games, games) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(games),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasMore));

  @JsonKey(ignore: true)
  @override
  _$GamesCopyWith<_Games> get copyWith =>
      __$GamesCopyWithImpl<_Games>(this, _$identity);
}

abstract class _Games implements Games {
  const factory _Games(
      {required List<Game> games, bool isLoading, bool hasMore}) = _$_Games;

  @override
  List<Game> get games;
  @override
  bool get isLoading;
  @override
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$GamesCopyWith<_Games> get copyWith => throw _privateConstructorUsedError;
}
