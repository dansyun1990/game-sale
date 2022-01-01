import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_sale/utils/converter.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    String? id,
    required String userId,
    required String userName,
    required String content,
    required List<String> like,
    @TimestampConverter() required DateTime createdAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  factory Review.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Review.fromJson(data).copyWith(id: doc.id);
  }
}
