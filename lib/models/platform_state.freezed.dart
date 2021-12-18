// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'platform_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlatformStateTearOff {
  const _$PlatformStateTearOff();

  _PlatformState call({List<int> platformList = const <int>[]}) {
    return _PlatformState(
      platformList: platformList,
    );
  }
}

/// @nodoc
const $PlatformState = _$PlatformStateTearOff();

/// @nodoc
mixin _$PlatformState {
  List<int> get platformList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlatformStateCopyWith<PlatformState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformStateCopyWith<$Res> {
  factory $PlatformStateCopyWith(
          PlatformState value, $Res Function(PlatformState) then) =
      _$PlatformStateCopyWithImpl<$Res>;
  $Res call({List<int> platformList});
}

/// @nodoc
class _$PlatformStateCopyWithImpl<$Res>
    implements $PlatformStateCopyWith<$Res> {
  _$PlatformStateCopyWithImpl(this._value, this._then);

  final PlatformState _value;
  // ignore: unused_field
  final $Res Function(PlatformState) _then;

  @override
  $Res call({
    Object? platformList = freezed,
  }) {
    return _then(_value.copyWith(
      platformList: platformList == freezed
          ? _value.platformList
          : platformList // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$PlatformStateCopyWith<$Res>
    implements $PlatformStateCopyWith<$Res> {
  factory _$PlatformStateCopyWith(
          _PlatformState value, $Res Function(_PlatformState) then) =
      __$PlatformStateCopyWithImpl<$Res>;
  @override
  $Res call({List<int> platformList});
}

/// @nodoc
class __$PlatformStateCopyWithImpl<$Res>
    extends _$PlatformStateCopyWithImpl<$Res>
    implements _$PlatformStateCopyWith<$Res> {
  __$PlatformStateCopyWithImpl(
      _PlatformState _value, $Res Function(_PlatformState) _then)
      : super(_value, (v) => _then(v as _PlatformState));

  @override
  _PlatformState get _value => super._value as _PlatformState;

  @override
  $Res call({
    Object? platformList = freezed,
  }) {
    return _then(_PlatformState(
      platformList: platformList == freezed
          ? _value.platformList
          : platformList // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_PlatformState implements _PlatformState {
  const _$_PlatformState({this.platformList = const <int>[]});

  @JsonKey()
  @override
  final List<int> platformList;

  @override
  String toString() {
    return 'PlatformState(platformList: $platformList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlatformState &&
            const DeepCollectionEquality()
                .equals(other.platformList, platformList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(platformList));

  @JsonKey(ignore: true)
  @override
  _$PlatformStateCopyWith<_PlatformState> get copyWith =>
      __$PlatformStateCopyWithImpl<_PlatformState>(this, _$identity);
}

abstract class _PlatformState implements PlatformState {
  const factory _PlatformState({List<int> platformList}) = _$_PlatformState;

  @override
  List<int> get platformList;
  @override
  @JsonKey(ignore: true)
  _$PlatformStateCopyWith<_PlatformState> get copyWith =>
      throw _privateConstructorUsedError;
}
