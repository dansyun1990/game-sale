import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:game_sale/constants/notification_type.dart';
import 'package:game_sale/models/favorite.dart';
import 'package:game_sale/models/game.dart';

/// お気に入り用リポジトリ
class FavoriteRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _uid = FirebaseAuth.instance.currentUser!.uid;

  /// ログインユーザのお気に入り一覧を取得
  Future<QuerySnapshot<Favorite>> getFavorites() async {
    return await _firebaseFirestore
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .withConverter<Favorite>(
          fromFirestore: (snapshot, _) =>
              Favorite.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        )
        .get();
  }

  /// お気に入り[favorites]からゲーム一覧を取得
  Future<QuerySnapshot<Game>> getGames(List<String> favorites) async {
    return await _firebaseFirestore
        .collection('games')
        .where(FieldPath.documentId, whereIn: favorites)
        .withConverter<Game>(
          fromFirestore: (snapshot, _) => Game.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        )
        .get();
  }

  /// 選択された[gameId]をお気に入りに追加
  Future<void> addFavorite(String gameId) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .doc(gameId)
        .set({
      'id': gameId,
      'notificationType': NotificationType.off.key,
      'createdAt': Timestamp.now(),
    });
  }

  /// 選択された[gameId]をお気に入りから削除
  Future<void> deleteFavorite(String gameId) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .doc(gameId)
        .delete();
  }

  /// 選択された[notificationType]で該当[gameId]の通知タイプを更新
  Future<void> updateNotification(String gameId, int notificationType) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .doc(gameId)
        .update({
      'notificationType': notificationType,
    });
  }
}
