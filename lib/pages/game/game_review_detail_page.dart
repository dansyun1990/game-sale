import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/review.dart';
import 'package:game_sale/widgets/review_card.dart';

/// ゲームレビュー詳細ページを作成
class GameReviewDetailPage extends StatelessWidget {
  const GameReviewDetailPage({
    Key? key,
    required this.gameId,
    required this.review,
  }) : super(key: key);

  /// ゲームID
  final String gameId;

  /// レビュー情報
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).reviewDetail),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ReviewCard(
          gameId: gameId,
          review: review,
          isDetail: true,
        ),
      ),
    );
  }
}
