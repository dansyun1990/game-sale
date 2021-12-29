// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReleaseGame _$$_ReleaseGameFromJson(Map<String, dynamic> json) =>
    _$_ReleaseGame(
      id: json['id'] as String?,
      name: json['name'] as String,
      platform: json['platform'] as String,
      coverArt: json['coverArt'] as String,
      genre: (json['genre'] as List<dynamic>).map((e) => e as String).toList(),
      basePrice: json['basePrice'] as int?,
      releaseDate: json['releaseDate'] as String,
    );

Map<String, dynamic> _$$_ReleaseGameToJson(_$_ReleaseGame instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'platform': instance.platform,
      'coverArt': instance.coverArt,
      'genre': instance.genre,
      'basePrice': instance.basePrice,
      'releaseDate': instance.releaseDate,
    };
