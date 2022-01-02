import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReviewRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _uid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addReview({
    required String gameId,
    String? reviewId,
    required double rating,
    required String content,
    int? difficulty,
    int? progress,
    int? clearTime,
  }) async {
    await _firebaseFirestore
        .collection('games')
        .doc(gameId)
        .collection('reviews')
        .doc(reviewId)
        .set({
      'userId': _uid,
      'userName': _uid,
      'like': [],
      'rating': rating,
      'content': content,
      'difficulty': difficulty,
      'progress': progress,
      'clearTime': clearTime,
      'createdAt': Timestamp.now(),
    });
  }

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
