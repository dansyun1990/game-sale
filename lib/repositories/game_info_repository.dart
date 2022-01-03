import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_sale/models/review.dart';
import 'package:game_sale/models/sale_history.dart';

/// ゲーム情報用リポジトリ
class GameInfoRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;

  /// 該当ゲーム[gameId]のセール履歴を取得
  Future<QuerySnapshot<SaleHistory>> getSaleHistory(String gameId) async {
    return await _firebaseFirestore
        .collection('games')
        .doc(gameId)
        .collection('saleHistory')
        .orderBy('createdAt')
        .withConverter<SaleHistory>(
          fromFirestore: (snapshot, _) =>
              SaleHistory.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        )
        .get();
  }

  /// 該当ゲーム[gameId]のレビュー一覧を取得
  Future<QuerySnapshot<Review>> getReviews(String gameId) async {
    return await _firebaseFirestore
        .collection('games')
        .doc(gameId)
        .collection('reviews')
        .limit(5)
        .orderBy('createdAt', descending: true)
        .withConverter<Review>(
          fromFirestore: (snapshot, _) => Review.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        )
        .get();
  }

  /// サインインユーザ[userId]のレビューを取得
  Future<QuerySnapshot<Review>> getReview(String gameId, String userId) async {
    return await _firebaseFirestore
        .collection('games')
        .doc(gameId)
        .collection('reviews')
        .where('userId', isEqualTo: userId)
        .withConverter<Review>(
          fromFirestore: (snapshot, _) => Review.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        )
        .get();
  }
}
