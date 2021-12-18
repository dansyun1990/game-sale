// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genre_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GenreStateTearOff {
  const _$GenreStateTearOff();

  _GenreState call({List<String> genreList = const <String>[]}) {
    return _GenreState(
      genreList: genreList,
    );
  }
}

/// @nodoc
const $GenreState = _$GenreStateTearOff();

/// @nodoc
mixin _$GenreState {
  List<String> get genreList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenreStateCopyWith<GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreStateCopyWith<$Res> {
  factory $GenreStateCopyWith(
          GenreState value, $Res Function(GenreState) then) =
      _$GenreStateCopyWithImpl<$Res>;
  $Res call({List<String> genreList});
}

/// @nodoc
class _$GenreStateCopyWithImpl<$Res> implements $GenreStateCopyWith<$Res> {
  _$GenreStateCopyWithImpl(this._value, this._then);

  final GenreState _value;
  // ignore: unused_field
  final $Res Function(GenreState) _then;

  @override
  $Res call({
    Object? genreList = freezed,
  }) {
    return _then(_value.copyWith(
      genreList: genreList == freezed
          ? _value.genreList
          : genreList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$GenreStateCopyWith<$Res> implements $GenreStateCopyWith<$Res> {
  factory _$GenreStateCopyWith(
          _GenreState value, $Res Function(_GenreState) then) =
      __$GenreStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> genreList});
}

/// @nodoc
class __$GenreStateCopyWithImpl<$Res> extends _$GenreStateCopyWithImpl<$Res>
    implements _$GenreStateCopyWith<$Res> {
  __$GenreStateCopyWithImpl(
      _GenreState _value, $Res Function(_GenreState) _then)
      : super(_value, (v) => _then(v as _GenreState));

  @override
  _GenreState get _value => super._value as _GenreState;

  @override
  $Res call({
    Object? genreList = freezed,
  }) {
    return _then(_GenreState(
      genreList: genreList == freezed
          ? _value.genreList
          : genreList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_GenreState implements _GenreState {
  const _$_GenreState({this.genreList = const <String>[]});

  @JsonKey()
  @override
  final List<String> genreList;

  @override
  String toString() {
    return 'GenreState(genreList: $genreList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenreState &&
            const DeepCollectionEquality().equals(other.genreList, genreList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(genreList));

  @JsonKey(ignore: true)
  @override
  _$GenreStateCopyWith<_GenreState> get copyWith =>
      __$GenreStateCopyWithImpl<_GenreState>(this, _$identity);
}

abstract class _GenreState implements GenreState {
  const factory _GenreState({List<String> genreList}) = _$_GenreState;

  @override
  List<String> get genreList;
  @override
  @JsonKey(ignore: true)
  _$GenreStateCopyWith<_GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}
