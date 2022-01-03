import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// ゲームレビュー用リポジトリ
class ReviewRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;

  /// 選択された[gameId]にレビューを追加
  Future<void> addReview({
    required String gameId,
    String? reviewId,
    required double rating,
    required String content,
    int? difficulty,
    int? progress,
    int? clearTime,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    await _firebaseFirestore
        .collection('games')
        .doc(gameId)
        .collection('reviews')
        .doc(reviewId)
        .set({
      'userId': currentUser.uid,
      'userName': currentUser.displayName,
      'like': [],
      'rating': rating,
      'content': content,
      'difficulty': difficulty,
      'progress': progress,
      'clearTime': clearTime,
      'createdAt': Timestamp.now(),
    });
  }

  /// 選択された[gameId]からレビューを削除
  Future<void> deleteReview({
    required String gameId,
    required String reviewId,
  }) async {
    await _firebaseFirestore
        .collection('games')
        .doc(gameId)
        .collection('reviews')
        .doc(reviewId)
        .delete();
  }
}
