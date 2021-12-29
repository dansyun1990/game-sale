import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_sale/constants/game_sort.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/models/release_game.dart';

class FirebaseApi {
  static Future<QuerySnapshot<Game>> getGames(
    int limit, {
    DocumentSnapshot? startAfter,
    required GameSort sort,
    required List<String> platforms,
    required List<String> genres,
  }) {
    var snapshots = FirebaseFirestore.instance
        .collection('games')
        .limit(limit)
        .withConverter<Game>(
          fromFirestore: (snapshot, _) => Game.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        );

    switch (sort) {
      case GameSort.releaseDateDesc:
        snapshots = snapshots.orderBy('releaseDate', descending: true);
        break;
      case GameSort.releaseDateAsc:
        snapshots = snapshots.orderBy('releaseDate');
        break;
      case GameSort.salePriceDesc:
        snapshots = snapshots.orderBy('salePrice', descending: true);
        break;
      case GameSort.salePriceAsc:
        snapshots = snapshots.orderBy('salePrice');
        break;
    }

    if (platforms.isNotEmpty) {
      snapshots = snapshots.where('platform', whereIn: platforms);
    }

    if (genres.isNotEmpty) {
      snapshots = snapshots.where('genre', arrayContainsAny: genres);
    }

    if (startAfter == null) {
      return snapshots.get();
    } else {
      return snapshots.startAfterDocument(startAfter).get();
    }
  }

  static Future<QuerySnapshot<ReleaseGame>> getReleaseGames(
    int limit, {
    String? platform,
    DocumentSnapshot? startAfter,
  }) {
    var snapshots = FirebaseFirestore.instance
        .collection('release')
        .orderBy('releaseDate')
        .limit(limit)
        .withConverter<ReleaseGame>(
          fromFirestore: (snapshot, _) =>
              ReleaseGame.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        );

    if (platform != null) {
      snapshots = snapshots.where('platform', isEqualTo: platform);
    }

    if (startAfter == null) {
      return snapshots.get();
    } else {
      return snapshots.startAfterDocument(startAfter).get();
    }
  }
}
