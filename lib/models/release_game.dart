import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_game.freezed.dart';
part 'release_game.g.dart';

@freezed
class ReleaseGame with _$ReleaseGame {
  const factory ReleaseGame({
    String? id,
    required String name,
    required String platform,
    required String coverArt,
    required List<String> genre,
    int? basePrice,
    required String releaseDate,
  }) = _ReleaseGame;

  factory ReleaseGame.fromJson(Map<String, dynamic> json) =>
      _$ReleaseGameFromJson(json);

  factory ReleaseGame.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return ReleaseGame.fromJson(data).copyWith(id: doc.id);
  }
}
