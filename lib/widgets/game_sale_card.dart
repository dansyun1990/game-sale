import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/models/chart.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/models/review.dart';
import 'package:game_sale/pages/game/game_info_page.dart';
import 'package:game_sale/repositories/game_info_repository.dart';
import 'package:game_sale/utils/util.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:game_sale/widgets/sale_price_text.dart';

import 'discount_chip.dart';

/// ゲームセール用のカードを作成
class GameSaleCard extends StatelessWidget {
  GameSaleCard({
    Key? key,
    required this.game,
    this.favoriteFlag = false,
  }) : super(key: key);

  /// ゲーム情報
  final Game game;

  /// お気に入りから遷移した場合のフラグ
  final bool favoriteFlag;

  /// ゲーム情報用リポジトリインスタンス生成
  final _gameInfoRepository = GameInfoRepository();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showLoaderDialog(context);
        final saleHistory =
            await _getSaleHistory(game.id!, game.releaseDate, game.basePrice);

        final minPrice =
            saleHistory.reduce((a, b) => a.price < b.price ? a : b).price;

        final reviews = await _getReviews(game.id!);

        final chartDate = [
          charts.Series<Chart, DateTime>(
            id: 'Sale',
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (Chart chart, _) => chart.time,
            measureFn: (Chart chart, _) => chart.price,
            data: saleHistory,
          )
        ];
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute<bool>(
            builder: (BuildContext context) => GameInfoPage(
              game: game,
              favoriteFlag: favoriteFlag,
              chartData: chartDate,
              minPrice: minPrice,
              reviews: reviews,
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
                              child: SalePriceText(
                                salePrice: game.salePrice,
                                basePrice: game.basePrice,
                              ),
                            ),
                            DiscountChip(
                              discountPercent: game.discountPercent,
                              discountedUntil: game.discountedUntil,
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

  Future<List<Chart>> _getSaleHistory(
    String gameId,
    String releaseDate,
    int basePrice,
  ) async {
    final snapshots = await _gameInfoRepository.getSaleHistory(gameId);

    final saleHistory = snapshots.docs.map((doc) => doc.data()).toList();

    String? maxDate;
    switch (saleHistory.length) {
      case 0:
        maxDate = null;
        break;
      case 1:
        maxDate = saleHistory.elementAt(0).saleEnd;
        break;
      default:
        saleHistory
            .reduce((a, b) =>
                DateTime.parse(a.saleEnd).isAfter(DateTime.parse(b.saleEnd))
                    ? a
                    : b)
            .saleEnd;
        break;
    }

    final List<Chart> chartList = [];
    chartList.add(Chart(DateTime.parse(releaseDate), basePrice));
    for (var element in saleHistory) {
      chartList.add(Chart(
          DateTime.parse(element.saleStart).add(const Duration(days: 1) * -1),
          element.basePrice));
      chartList
          .add(Chart(DateTime.parse(element.saleStart), element.salePrice));
      chartList.add(Chart(DateTime.parse(element.saleEnd), element.salePrice));
      chartList.add(Chart(
          DateTime.parse(element.saleEnd).add(const Duration(days: 1)),
          element.basePrice));
    }
    if (maxDate == null || !DateTime.parse(maxDate).isAfter(DateTime.now())) {
      chartList.add(Chart(DateTime.now(), basePrice));
    }
    return chartList;
  }

  Future<List<Review>> _getReviews(String gameId) async {
    final snapshots = await _gameInfoRepository.getReviews(gameId);

    return snapshots.docs.map((doc) => doc.data()).toList();
  }
}
