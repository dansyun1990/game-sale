import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/favorite.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/widgets/game_sale_card.dart';

import 'notification_button.dart';

/// お気に入り用のカードを作成
class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key? key,
    required this.game,
    required this.favorite,
    required this.animation,
    this.onClicked,
  }) : super(key: key);

  /// ゲーム情報
  final Game game;

  /// お気に入り情報
  final Favorite favorite;

  /// アニメーション
  final Animation<double> animation;

  /// 削除ボタン用クリックコールバック
  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Card(
          elevation: 0.0,
          child: Column(
            children: [
              GameSaleCard(
                game: game,
                favoriteFlag: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    NotificationButton(favorite: favorite),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: onClicked,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        elevation: 0.0,
                        primary: Colors.grey[200],
                      ),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black54,
                        size: 16.0,
                      ),
                      label: Text(
                        S.of(context).remove,
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
