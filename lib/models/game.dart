import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    String? id,
    required String name,
    required String subName,
    required String platform,
    required String coverArt,
    required List<String> genre,
    required int basePrice,
    required int salePrice,
    required int discountPercent,
    required String discountedUntil,
    required String releaseDate,
    required String desc,
    required String developer,
    required String publisher,
    required String rating,
    required List<String> languages,
    required List<String> voice,
    required int size,
    required List<String> screenshot,
    required String storeURL,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  factory Game.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Game.fromJson(data).copyWith(id: doc.id);
  }
}
