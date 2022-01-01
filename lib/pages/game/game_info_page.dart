import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/constants/game_rating.dart';
import 'package:game_sale/constants/notification_type.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/chart.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/models/user.dart';
import 'package:game_sale/pages/settings/favorite_page.dart';
import 'package:game_sale/providers/auth_provider.dart';
import 'package:game_sale/providers/favorite_provider.dart';
import 'package:game_sale/widgets/card_tag.dart';
import 'package:game_sale/widgets/discount_chip.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:game_sale/widgets/sale_history_chart.dart';
import 'package:game_sale/widgets/sale_price_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'game_detail_page.dart';

/// ゲーム情報ページを作成
class GameInfoPage extends HookConsumerWidget {
  const GameInfoPage({
    Key? key,
    required this.game,
    this.favoriteFlag = false,
    required this.chartData,
    required this.minPrice,
  }) : super(key: key);

  final Game game;
  final bool? favoriteFlag;
  final List<charts.Series<Chart, DateTime>> chartData;
  final int minPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        if (favoriteFlag!) {
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
              GameReview(),
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
                return FutureBuilder(
                  future: checkFavorite(
                      ref.watch(authProvider).user?.uid, game.id!),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasData) {
                      return IconButton(
                        icon: !snapshot.data!
                            ? const Icon(Icons.favorite_outline)
                            : const Icon(Icons.favorite),
                        color: Theme.of(context).primaryColor,
                        onPressed: () async {
                          if (!snapshot.data!) {
                            if (favoriteFlag!) {
                              await ref
                                  .read(favoriteProvider.notifier)
                                  .addFavorite(game.id!);
                            } else {
                              await addFavorite(
                                  ref.watch(authProvider).user?.uid, game.id!);
                            }
                            ref.refresh(authProvider);
                          } else {
                            if (favoriteFlag!) {
                              await ref
                                  .read(favoriteProvider.notifier)
                                  .deleteFavorite(game.id!);
                            } else {
                              await deleteFavorite(
                                  ref.watch(authProvider).user?.uid, game.id!);
                            }
                            ref.refresh(authProvider);
                          }
                        },
                      );
                    }
                    return IconButton(
                      icon: const Icon(Icons.favorite_outline),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return AlertDialog(
                              content: Text(
                                'サインインしてくだい。',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("キャンセル"),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                  child: Text("サインイン"),
                                  onPressed: () => print('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                );
              }),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.share_outlined),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add_comment),
          onPressed: () async {},
          label: Text('レビュー'),
        ),
      ),
    );
  }

  Future<bool?> checkFavorite(String? uid, String gameId) async {
    if (uid == null) {
      return null;
    }
    var snapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .where('id', isEqualTo: gameId)
        .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromDocumentSnapshot(snapshot),
          toFirestore: (obj, _) => obj.toJson(),
        )
        .get();

    if (snapshots.size == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> addFavorite(String? uid, String gameId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(gameId)
        .set({
      'id': gameId,
      'notificationType': NotificationType.off.key,
      'createdAt': Timestamp.now(),
    });
  }

  Future<void> deleteFavorite(String? uid, String gameId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(gameId)
        .delete();
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
              height: 120,
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
            const SizedBox(height: 10),
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
                            fontSize: 18,
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
                      fontSize: 12,
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
                    style: const TextStyle(fontSize: 14),
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
                  borderRadius: BorderRadius.circular(12),
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

class GameReview extends StatelessWidget {
  const GameReview({Key? key}) : super(key: key);

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
                    '人気レビュー',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '木下藤吉郎',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '2021-10-01 10:00',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_outlined,
                      size: 16,
                      color: Colors.deepPurpleAccent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                'これゲーム最高です。',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Divider(),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '木下藤吉郎',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '2021-10-01 10:00',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_outlined,
                      size: 16,
                      color: Colors.deepPurpleAccent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                'これゲーム最高です。',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    'レビューを全部見る',
                    style: TextStyle(
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
            ),
          ],
        ),
      ),
    );
  }
}
