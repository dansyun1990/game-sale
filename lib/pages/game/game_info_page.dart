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
import 'package:game_sale/providers/check_favorite_provider.dart';
import 'package:game_sale/providers/favorite_provider.dart';
import 'package:game_sale/repositories/game_info_repository.dart';
import 'package:game_sale/utils/util.dart';
import 'package:game_sale/widgets/card_tag.dart';
import 'package:game_sale/widgets/discount_chip.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:game_sale/widgets/review_card.dart';
import 'package:game_sale/widgets/sale_history_chart.dart';
import 'package:game_sale/widgets/sale_price_text.dart';
import 'package:game_sale/widgets/sign_in_dialog.dart';
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
    required this.chartData,
    required this.minPrice,
    required this.reviews,
  }) : super(key: key);

  final Game game;
  final bool favoriteFlag;
  final List<charts.Series<Chart, DateTime>> chartData;
  final int minPrice;
  final List<Review> reviews;

  final gameInfoRepository = GameInfoRepository();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
        .watch(checkFavoriteProvider.notifier)
        .checkFavorite(ref.watch(authProvider).user?.uid, game.id!);

    return WillPopScope(
      onWillPop: () async {
        if (favoriteFlag) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FavoritePage(
                favorites: ref.read(favoriteProvider),
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
              GameInfo(game: game),
              const SizedBox(height: 8.0),
              GamePrice(
                game: game,
                minPrice: minPrice,
                chartData: chartData,
              ),
              const SizedBox(height: 8.0),
              GameReview(gameId: game.id!, reviews: reviews),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 4.0,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              HookConsumer(builder: (context, ref, child) {
                final favorite = ref.watch(checkFavoriteProvider);
                return IconButton(
                  icon: favorite == true
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_outline),
                  color: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  onPressed: () async {
                    if (favorite == null) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const SignInDialog();
                        },
                      );
                      return;
                    }
                    if (!favorite) {
                      ref
                          .watch(checkFavoriteProvider.notifier)
                          .addFavorite(favoriteFlag, game.id!);
                    } else {
                      ref
                          .watch(checkFavoriteProvider.notifier)
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
          icon: const Icon(Icons.add_comment),
          label: Text('レビュー'),
          onPressed: () async {
            if (ref.read(authProvider).user == null) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return const SignInDialog();
                },
              );
              return;
            }

            showLoaderDialog(context);

            final snapshots = await gameInfoRepository.getReview(
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

class GameInfo extends StatelessWidget {
  const GameInfo({Key? key, required this.game}) : super(key: key);

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
                            (gamePlatform) =>
                                gamePlatform.value == game.platform),
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

class GamePrice extends StatelessWidget {
  const GamePrice({
    Key? key,
    required this.game,
    required this.minPrice,
    required this.chartData,
  }) : super(key: key);

  final Game game;
  final int minPrice;
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

class GameReview extends HookConsumerWidget {
  const GameReview({Key? key, required this.gameId, required this.reviews})
      : super(key: key);

  final String gameId;
  final List<Review> reviews;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text('レビューがまだありません。'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
