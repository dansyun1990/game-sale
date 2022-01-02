import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_sale/models/review.dart';

class GameInfoRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;

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
