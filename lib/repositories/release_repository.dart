import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_sale/models/release_game.dart';

/// ゲームリリース用リポジトリ
class ReleaseRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;

  /// ゲームリリース一覧を取得
  Future<QuerySnapshot<ReleaseGame>> getReleaseGames(
    int limit, {
    String? platform,
    DocumentSnapshot? startAfter,
  }) {
    var snapshots = _firebaseFirestore
        .collection('release')
        .orderBy('releaseDate')
        .orderBy('name')
        .limit(limit)
        .withConverter<ReleaseGame>(
          fromFirestore: (snapshot, _) =>
              ReleaseGame.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        );

    if (platform != null) {
      snapshots = snapshots.where('platform', isEqualTo: platform);
    } else {
      snapshots = snapshots.orderBy('platform');
    }

    if (startAfter == null) {
      return snapshots.get();
    } else {
      return snapshots.startAfterDocument(startAfter).get();
    }
  }
}
