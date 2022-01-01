import 'package:flutter/material.dart';
import 'package:game_sale/models/review.dart';
import 'package:game_sale/widgets/review_card.dart';

class GameReviewDetailPage extends StatelessWidget {
  const GameReviewDetailPage({
    Key? key,
    required this.gameId,
    required this.review,
  }) : super(key: key);

  final String gameId;
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('レビュー詳細'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ReviewCard(gameId: gameId, review: review, isDetail: true),
      ),
    );
  }
}
