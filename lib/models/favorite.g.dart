// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favorite _$$_FavoriteFromJson(Map<String, dynamic> json) => _$_Favorite(
      id: json['id'] as String,
      notificationType: json['notificationType'] as int,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_FavoriteToJson(_$_Favorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationType': instance.notificationType,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
