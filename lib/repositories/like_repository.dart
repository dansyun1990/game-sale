import 'package:cloud_firestore/cloud_firestore.dart';

class LikeRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;

  /// 選択された[reviewId]に[userId]を追加
  Future<void> addLike(String gameId, String reviewId, String userId) async {
    await _firebaseFirestore
        .collection('games')
        .doc(gameId)
        .collection('reviews')
        .doc(reviewId)
        .update({
      'like': FieldValue.arrayUnion([userId])
    });
  }

  /// 選択された[reviewId]から[userId]を削除
  Future<void> deleteLike(String gameId, String reviewId, String userId) async {
    await _firebaseFirestore
        .collection('games')
        .doc(gameId)
        .collection('reviews')
        .doc(reviewId)
        .update({
      'like': FieldValue.arrayRemove([userId])
    });
  }
}
