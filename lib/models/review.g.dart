// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      content: json['content'] as String,
      like: (json['like'] as List<dynamic>).map((e) => e as String).toList(),
      rating: (json['rating'] as num).toDouble(),
      difficulty: json['difficulty'] as int?,
      progress: json['progress'] as int?,
      clearTime: json['clearTime'] as int?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'content': instance.content,
      'like': instance.like,
      'rating': instance.rating,
      'difficulty': instance.difficulty,
      'progress': instance.progress,
      'clearTime': instance.clearTime,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
