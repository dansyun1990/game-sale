// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaleHistory _$$_SaleHistoryFromJson(Map<String, dynamic> json) =>
    _$_SaleHistory(
      saleStart: json['saleStart'] as String,
      saleEnd: json['saleEnd'] as String,
      basePrice: json['basePrice'] as int,
      salePrice: json['salePrice'] as int,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_SaleHistoryToJson(_$_SaleHistory instance) =>
    <String, dynamic>{
      'saleStart': instance.saleStart,
      'saleEnd': instance.saleEnd,
      'basePrice': instance.basePrice,
      'salePrice': instance.salePrice,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
