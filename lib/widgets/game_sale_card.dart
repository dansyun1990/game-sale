import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/pages/game/game_info_page.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:intl/intl.dart';

/// ゲームセール用のカードを作成
class GameSaleCard extends StatelessWidget {
  const GameSaleCard({
    Key? key,
    required this.game,
    this.favoriteFlag = false,
  }) : super(key: key);

  /// ゲーム情報
  final Game game;

  /// お気に入りから遷移した場合のフラグ
  final bool? favoriteFlag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool>(
            builder: (BuildContext context) => GameInfoPage(
              game: game,
              favoriteFlag: favoriteFlag,
            ),
          ),
        );
      },
      child: Card(
        elevation: 0.0,
        child: SizedBox(
          height: 110.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image(
                  width: 110.0,
                  image: CachedNetworkImageProvider(game.coverArt),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 4.0, 3.0, 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  game.genre
                                      .map((genre) => GameGenre.values
                                          .firstWhere((gameGenre) =>
                                              gameGenre.key == genre)
                                          .value)
                                      .toList()
                                      .join(' / '),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PlatformTag(
                            platform: GamePlatform.values.firstWhere(
                                (gamePlatform) =>
                                    gamePlatform.value == game.platform),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: NumberFormat.simpleCurrency(
                                              locale: 'ja')
                                          .format(game.salePrice),
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          NumberFormat.simpleCurrency(
                                                  locale: 'ja')
                                              .format(game.basePrice),
                                          style: const TextStyle(
                                            fontSize: 9.0,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Chip(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              backgroundColor: Colors.red,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              label: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '-${game.discountPercent}%',
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(text: '\n'),
                                    TextSpan(
                                      text: S.of(context).daysLeft(
                                          DateTime.parse(game.discountedUntil)
                                              .difference(DateTime.now())
                                              .inDays),
                                      style: const TextStyle(fontSize: 8.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
