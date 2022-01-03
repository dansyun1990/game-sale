import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_sale/constants/game_sort.dart';
import 'package:game_sale/models/game.dart';

/// ゲームセール用リポジトリ
class GamesRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;

  /// ゲームセール一覧を取得
  Future<QuerySnapshot<Game>> getGames(
    int limit, {
    DocumentSnapshot? startAfter,
    required GameSort sort,
    required List<String> platforms,
    required List<String> genres,
  }) {
    var snapshots = _firebaseFirestore
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

  /// [gameName]検索でゲームセール一覧を取得
  Future<QuerySnapshot<Game>> getSearchGames(String gameName) async {
    return await _firebaseFirestore
        .collection('games')
        .where('name', isEqualTo: gameName)
        .withConverter<Game>(
          fromFirestore: (snapshot, _) => Game.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        )
        .get();
  }
}
