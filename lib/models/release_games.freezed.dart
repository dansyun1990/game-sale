// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'release_games.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReleaseGamesTearOff {
  const _$ReleaseGamesTearOff();

  _ReleaseGames call(
      {required List<ReleaseGame> releaseGames,
      bool isLoading = false,
      bool hasMore = false}) {
    return _ReleaseGames(
      releaseGames: releaseGames,
      isLoading: isLoading,
      hasMore: hasMore,
    );
  }
}

/// @nodoc
const $ReleaseGames = _$ReleaseGamesTearOff();

/// @nodoc
mixin _$ReleaseGames {
  List<ReleaseGame> get releaseGames => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReleaseGamesCopyWith<ReleaseGames> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseGamesCopyWith<$Res> {
  factory $ReleaseGamesCopyWith(
          ReleaseGames value, $Res Function(ReleaseGames) then) =
      _$ReleaseGamesCopyWithImpl<$Res>;
  $Res call({List<ReleaseGame> releaseGames, bool isLoading, bool hasMore});
}

/// @nodoc
class _$ReleaseGamesCopyWithImpl<$Res> implements $ReleaseGamesCopyWith<$Res> {
  _$ReleaseGamesCopyWithImpl(this._value, this._then);

  final ReleaseGames _value;
  // ignore: unused_field
  final $Res Function(ReleaseGames) _then;

  @override
  $Res call({
    Object? releaseGames = freezed,
    Object? isLoading = freezed,
    Object? hasMore = freezed,
  }) {
    return _then(_value.copyWith(
      releaseGames: releaseGames == freezed
          ? _value.releaseGames
          : releaseGames // ignore: cast_nullable_to_non_nullable
              as List<ReleaseGame>,
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
abstract class _$ReleaseGamesCopyWith<$Res>
    implements $ReleaseGamesCopyWith<$Res> {
  factory _$ReleaseGamesCopyWith(
          _ReleaseGames value, $Res Function(_ReleaseGames) then) =
      __$ReleaseGamesCopyWithImpl<$Res>;
  @override
  $Res call({List<ReleaseGame> releaseGames, bool isLoading, bool hasMore});
}

/// @nodoc
class __$ReleaseGamesCopyWithImpl<$Res> extends _$ReleaseGamesCopyWithImpl<$Res>
    implements _$ReleaseGamesCopyWith<$Res> {
  __$ReleaseGamesCopyWithImpl(
      _ReleaseGames _value, $Res Function(_ReleaseGames) _then)
      : super(_value, (v) => _then(v as _ReleaseGames));

  @override
  _ReleaseGames get _value => super._value as _ReleaseGames;

  @override
  $Res call({
    Object? releaseGames = freezed,
    Object? isLoading = freezed,
    Object? hasMore = freezed,
  }) {
    return _then(_ReleaseGames(
      releaseGames: releaseGames == freezed
          ? _value.releaseGames
          : releaseGames // ignore: cast_nullable_to_non_nullable
              as List<ReleaseGame>,
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

class _$_ReleaseGames implements _ReleaseGames {
  const _$_ReleaseGames(
      {required this.releaseGames,
      this.isLoading = false,
      this.hasMore = false});

  @override
  final List<ReleaseGame> releaseGames;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'ReleaseGames(releaseGames: $releaseGames, isLoading: $isLoading, hasMore: $hasMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReleaseGames &&
            const DeepCollectionEquality()
                .equals(other.releaseGames, releaseGames) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(releaseGames),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasMore));

  @JsonKey(ignore: true)
  @override
  _$ReleaseGamesCopyWith<_ReleaseGames> get copyWith =>
      __$ReleaseGamesCopyWithImpl<_ReleaseGames>(this, _$identity);
}

abstract class _ReleaseGames implements ReleaseGames {
  const factory _ReleaseGames(
      {required List<ReleaseGame> releaseGames,
      bool isLoading,
      bool hasMore}) = _$_ReleaseGames;

  @override
  List<ReleaseGame> get releaseGames;
  @override
  bool get isLoading;
  @override
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$ReleaseGamesCopyWith<_ReleaseGames> get copyWith =>
      throw _privateConstructorUsedError;
}
