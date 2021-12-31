import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_sale/utils/converter.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    required String id,
    required int notificationType,
    @TimestampConverter() required DateTime createdAt,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);

  factory Favorite.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Favorite.fromJson(data);
  }
}
