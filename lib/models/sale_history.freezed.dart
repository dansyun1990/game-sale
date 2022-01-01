// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sale_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaleHistory _$SaleHistoryFromJson(Map<String, dynamic> json) {
  return _SaleHistory.fromJson(json);
}

/// @nodoc
class _$SaleHistoryTearOff {
  const _$SaleHistoryTearOff();

  _SaleHistory call(
      {required String saleStart,
      required String saleEnd,
      required int basePrice,
      required int salePrice,
      @TimestampConverter() required DateTime createdAt}) {
    return _SaleHistory(
      saleStart: saleStart,
      saleEnd: saleEnd,
      basePrice: basePrice,
      salePrice: salePrice,
      createdAt: createdAt,
    );
  }

  SaleHistory fromJson(Map<String, Object?> json) {
    return SaleHistory.fromJson(json);
  }
}

/// @nodoc
const $SaleHistory = _$SaleHistoryTearOff();

/// @nodoc
mixin _$SaleHistory {
  String get saleStart => throw _privateConstructorUsedError;
  String get saleEnd => throw _privateConstructorUsedError;
  int get basePrice => throw _privateConstructorUsedError;
  int get salePrice => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleHistoryCopyWith<SaleHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleHistoryCopyWith<$Res> {
  factory $SaleHistoryCopyWith(
          SaleHistory value, $Res Function(SaleHistory) then) =
      _$SaleHistoryCopyWithImpl<$Res>;
  $Res call(
      {String saleStart,
      String saleEnd,
      int basePrice,
      int salePrice,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$SaleHistoryCopyWithImpl<$Res> implements $SaleHistoryCopyWith<$Res> {
  _$SaleHistoryCopyWithImpl(this._value, this._then);

  final SaleHistory _value;
  // ignore: unused_field
  final $Res Function(SaleHistory) _then;

  @override
  $Res call({
    Object? saleStart = freezed,
    Object? saleEnd = freezed,
    Object? basePrice = freezed,
    Object? salePrice = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      saleStart: saleStart == freezed
          ? _value.saleStart
          : saleStart // ignore: cast_nullable_to_non_nullable
              as String,
      saleEnd: saleEnd == freezed
          ? _value.saleEnd
          : saleEnd // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: basePrice == freezed
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
      salePrice: salePrice == freezed
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$SaleHistoryCopyWith<$Res>
    implements $SaleHistoryCopyWith<$Res> {
  factory _$SaleHistoryCopyWith(
          _SaleHistory value, $Res Function(_SaleHistory) then) =
      __$SaleHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String saleStart,
      String saleEnd,
      int basePrice,
      int salePrice,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$SaleHistoryCopyWithImpl<$Res> extends _$SaleHistoryCopyWithImpl<$Res>
    implements _$SaleHistoryCopyWith<$Res> {
  __$SaleHistoryCopyWithImpl(
      _SaleHistory _value, $Res Function(_SaleHistory) _then)
      : super(_value, (v) => _then(v as _SaleHistory));

  @override
  _SaleHistory get _value => super._value as _SaleHistory;

  @override
  $Res call({
    Object? saleStart = freezed,
    Object? saleEnd = freezed,
    Object? basePrice = freezed,
    Object? salePrice = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_SaleHistory(
      saleStart: saleStart == freezed
          ? _value.saleStart
          : saleStart // ignore: cast_nullable_to_non_nullable
              as String,
      saleEnd: saleEnd == freezed
          ? _value.saleEnd
          : saleEnd // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: basePrice == freezed
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
      salePrice: salePrice == freezed
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
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
class _$_SaleHistory implements _SaleHistory {
  const _$_SaleHistory(
      {required this.saleStart,
      required this.saleEnd,
      required this.basePrice,
      required this.salePrice,
      @TimestampConverter() required this.createdAt});

  factory _$_SaleHistory.fromJson(Map<String, dynamic> json) =>
      _$$_SaleHistoryFromJson(json);

  @override
  final String saleStart;
  @override
  final String saleEnd;
  @override
  final int basePrice;
  @override
  final int salePrice;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'SaleHistory(saleStart: $saleStart, saleEnd: $saleEnd, basePrice: $basePrice, salePrice: $salePrice, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaleHistory &&
            const DeepCollectionEquality().equals(other.saleStart, saleStart) &&
            const DeepCollectionEquality().equals(other.saleEnd, saleEnd) &&
            const DeepCollectionEquality().equals(other.basePrice, basePrice) &&
            const DeepCollectionEquality().equals(other.salePrice, salePrice) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(saleStart),
      const DeepCollectionEquality().hash(saleEnd),
      const DeepCollectionEquality().hash(basePrice),
      const DeepCollectionEquality().hash(salePrice),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$SaleHistoryCopyWith<_SaleHistory> get copyWith =>
      __$SaleHistoryCopyWithImpl<_SaleHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaleHistoryToJson(this);
  }
}

abstract class _SaleHistory implements SaleHistory {
  const factory _SaleHistory(
      {required String saleStart,
      required String saleEnd,
      required int basePrice,
      required int salePrice,
      @TimestampConverter() required DateTime createdAt}) = _$_SaleHistory;

  factory _SaleHistory.fromJson(Map<String, dynamic> json) =
      _$_SaleHistory.fromJson;

  @override
  String get saleStart;
  @override
  String get saleEnd;
  @override
  int get basePrice;
  @override
  int get salePrice;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$SaleHistoryCopyWith<_SaleHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
