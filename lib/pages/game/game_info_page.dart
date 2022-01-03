import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/constants/game_rating.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/chart.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/models/review.dart';
import 'package:game_sale/pages/settings/favorite_page.dart';
import 'package:game_sale/providers/auth_provider.dart';
import 'package:game_sale/providers/favorite_provider.dart';
import 'package:game_sale/providers/favorites_provider.dart';
import 'package:game_sale/repositories/game_info_repository.dart';
import 'package:game_sale/utils/util.dart';
import 'package:game_sale/widgets/card_tag.dart';
import 'package:game_sale/widgets/discount_chip.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:game_sale/widgets/review_card.dart';
import 'package:game_sale/widgets/sale_history_chart.dart';
import 'package:game_sale/widgets/sale_price_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'game_detail_page.dart';
import 'game_review_page.dart';

/// ゲーム情報ページを作成
class GameInfoPage extends HookConsumerWidget {
  GameInfoPage({
    Key? key,
    required this.game,
    this.favoriteFlag = false,
    required this.minPrice,
    required this.chartData,
    required this.reviews,
  }) : super(key: key);

  /// ゲーム情報
  final Game game;

  /// お気に入りから遷移した場合のフラグ
  final bool favoriteFlag;

  /// ゲームの最安値
  final int minPrice;

  /// グラフ表示用のセール履歴データ
  final List<charts.Series<Chart, DateTime>> chartData;

  /// レビュー情報
  final List<Review> reviews;

  /// ゲーム情報用リポジトリインスタンス生成
  final _gameInfoRepository = GameInfoRepository();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
        .watch(favoriteProvider.notifier)
        .checkFavorite(ref.watch(authProvider).user?.uid, game.id!);

    return WillPopScope(
      onWillPop: () async {
        if (favoriteFlag) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FavoritePage(
                favorites: ref.read(favoritesProvider),
              ),
            ),
          );
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).gameInfo),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _GameInfo(game: game),
              const SizedBox(height: 8.0),
              _GamePrice(
                game: game,
                minPrice: minPrice,
                chartData: chartData,
              ),
              const SizedBox(height: 8.0),
              _GameReview(gameId: game.id!, reviews: reviews),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 4.0,
          shape: AutomaticNotchedShape(
            const RoundedRectangleBorder(),
            BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Row(
            children: [
              HookConsumer(builder: (context, ref, child) {
                final favorite = ref.watch(favoriteProvider);
                return IconButton(
                  icon: favorite == true
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_outline),
                  color: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  onPressed: () async {
                    if (favorite == null) {
                      showSignInDialog(context);
                      return;
                    }
                    if (!favorite) {
                      ref
                          .watch(favoriteProvider.notifier)
                          .addFavorite(favoriteFlag, game.id!);
                    } else {
                      ref
                          .watch(favoriteProvider.notifier)
                          .deleteFavorite(favoriteFlag, game.id!);
                    }
                  },
                );
              }),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.share_outlined),
                color: Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          icon: const Icon(Icons.rate_review_sharp),
          label: Text(S.of(context).review),
          onPressed: () async {
            if (ref.read(authProvider).user == null) {
              showSignInDialog(context);
              return;
            }

            showLoaderDialog(context);

            final snapshots = await _gameInfoRepository.getReview(
                game.id!, ref.read(authProvider).user!.uid);

            final review = snapshots.size == 0
                ? null
                : snapshots.docs.map((doc) => doc.data()).toList();

            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute<bool>(
                builder: (BuildContext context) => GameReviewPage(
                  gameId: game.id!,
                  name: game.name,
                  subName: game.subName,
                  review: review?.elementAt(0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _GameInfo extends StatelessWidget {
  const _GameInfo({Key? key, required this.game}) : super(key: key);

  /// ゲーム情報
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.0,
              child: ListView.builder(
                itemCount: game.screenshot.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: CachedNetworkImage(
                        imageUrl: game.screenshot.elementAt(index),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<bool>(
                    builder: (BuildContext context) => GameDetailPage(
                      name: game.name,
                      developer: game.developer,
                      publisher: game.publisher,
                      releaseDate: game.releaseDate,
                      genre: game.genre,
                      platform: game.platform,
                      voice: game.voice,
                      languages: game.languages,
                      desc: game.desc,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          game.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      PlatformTag(
                        platform: GamePlatform.values.firstWhere(
                          (gamePlatform) => gamePlatform.value == game.platform,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    game.subName,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: game.releaseDate,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const WidgetSpan(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.0),
                                      child: Text(
                                        '/',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${(game.size / 1024 / 1024).toStringAsFixed(2)}GB',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: game.genre
                                .map(
                                  (genre) => Padding(
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: CardTag(
                                      text: GameGenre.values
                                          .firstWhere((gameGenre) =>
                                              gameGenre.key == genre)
                                          .value,
                                      textColor: Colors.black,
                                      backgroundColor: Colors.grey[300]!,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GameRating.values
                          .firstWhere(
                              (gameRating) => gameRating.key == game.rating)
                          .image
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    game.desc,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GamePrice extends StatelessWidget {
  const _GamePrice({
    Key? key,
    required this.game,
    required this.minPrice,
    required this.chartData,
  }) : super(key: key);

  /// ゲーム情報
  final Game game;

  /// ゲームの最安値
  final int minPrice;

  /// グラフ表示用のセール履歴データ
  final List<charts.Series<Chart, DateTime>> chartData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  S.of(context).digitalEditionPrice,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  S.of(context).bestPrice +
                      ':' +
                      NumberFormat.simpleCurrency(locale: 'ja')
                          .format(minPrice),
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () async {
                await launch(
                  game.storeURL,
                  forceSafariVC: true,
                  forceWebView: true,
                  enableJavaScript: true,
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).currentPrice,
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.black54,
                      ),
                    ),
                    DiscountChip(
                      discountPercent: game.discountPercent,
                      discountedUntil: game.discountedUntil,
                    ),
                    SalePriceText(
                      salePrice: game.salePrice,
                      basePrice: game.basePrice,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            SaleHistoryChart(seriesList: chartData),
          ],
        ),
      ),
    );
  }
}

class _GameReview extends StatelessWidget {
  const _GameReview({Key? key, required this.gameId, required this.reviews})
      : super(key: key);

  /// ゲームID
  final String gameId;

  /// レビュー情報
  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    S.of(context).newReviews,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            ListView.builder(
                key: UniqueKey(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return ReviewCard(
                    gameId: gameId,
                    review: reviews.elementAt(index),
                  );
                }),
            reviews.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).seeAllReviews,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.blue,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 10.0,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text(S.of(context).noReview),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
