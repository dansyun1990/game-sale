// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      id: json['id'] as String?,
      name: json['name'] as String,
      subName: json['subName'] as String,
      platform: json['platform'] as String,
      coverArt: json['coverArt'] as String,
      genre: (json['genre'] as List<dynamic>).map((e) => e as String).toList(),
      basePrice: json['basePrice'] as int,
      salePrice: json['salePrice'] as int,
      discountPercent: json['discountPercent'] as int,
      discountedUntil: json['discountedUntil'] as String,
      releaseDate: json['releaseDate'] as String,
      desc: json['desc'] as String,
      developer: json['developer'] as String,
      publisher: json['publisher'] as String,
      rating: json['rating'] as String,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      voice: (json['voice'] as List<dynamic>).map((e) => e as String).toList(),
      size: json['size'] as int,
      screenshot: (json['screenshot'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      storeURL: json['storeURL'] as String,
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subName': instance.subName,
      'platform': instance.platform,
      'coverArt': instance.coverArt,
      'genre': instance.genre,
      'basePrice': instance.basePrice,
      'salePrice': instance.salePrice,
      'discountPercent': instance.discountPercent,
      'discountedUntil': instance.discountedUntil,
      'releaseDate': instance.releaseDate,
      'desc': instance.desc,
      'developer': instance.developer,
      'publisher': instance.publisher,
      'rating': instance.rating,
      'languages': instance.languages,
      'voice': instance.voice,
      'size': instance.size,
      'screenshot': instance.screenshot,
      'storeURL': instance.storeURL,
    };
