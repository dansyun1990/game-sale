import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/game_genre.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/constants/game_rating.dart';
import 'package:game_sale/constants/notification_type.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/models/user.dart';
import 'package:game_sale/pages/settings/favorite_page.dart';
import 'package:game_sale/providers/auth_provider.dart';
import 'package:game_sale/providers/favorite_provider.dart';
import 'package:game_sale/widgets/card_tag.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'game_detail_page.dart';

/// ゲーム情報ページを作成
class GameInfoPage extends HookConsumerWidget {
  const GameInfoPage({
    Key? key,
    required this.game,
    this.favoriteFlag = false,
  }) : super(key: key);

  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;

  final Game game;
  final bool? favoriteFlag;

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
              Card(
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
                                            gamePlatform.value ==
                                            game.platform)),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0),
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
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.0),
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
                                              padding: const EdgeInsets.only(
                                                  right: 3.0),
                                              child: CardTag(
                                                text: GameGenre.values
                                                    .firstWhere((gameGenre) =>
                                                        gameGenre.key == genre)
                                                    .value,
                                                textColor: Colors.black,
                                                backgroundColor:
                                                    Colors.grey[300]!,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                GameRating.values
                                    .firstWhere((gameRating) =>
                                        gameRating.key == game.rating)
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
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ダウンロード版価格',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            '最安値：￥4,000',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      SelectionCallbackExample.withSampleData(),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
              ),
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
          onPressed: () {},
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

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  DetailSliverDelegate(
      this.expandedHeight, this.url, this.roundedContainerHeight);

  final double expandedHeight;
  final String url;
  final double roundedContainerHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Image.asset(
          url,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
          ),
        ),
        Positioned(
            top: expandedHeight - 120 - shrinkOffset,
            left: 30,
            child: Text('test')),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw true;
  }
}

class SimpleTimeSeriesChart extends HookConsumerWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {required this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  final _time = useState<DateTime?>(null);
  final _measures = useState<Map<String?, num>?>(null);

  // Listens to the underlying selection changes, and updates the information
  // relevant to building the primitive legend like information under the
  // chart.
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    DateTime? time;
    final measures = <String?, num>{};

    // We get the model that updated with a list of [SeriesDatum] which is
    // simply a pair of series & datum.
    //
    // Walk the selection updating the measures map, storing off the sales and
    // series name for each selection point.
    if (selectedDatum.isNotEmpty) {
      time = selectedDatum.first.datum.time;
      for (var datumPair in selectedDatum) {
        measures[datumPair.series.displayName] = datumPair.datum.sales;
      }
    }

    _time.value = time;
    _measures.value = measures;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleCurrencyFormatter =
        charts.BasicNumericTickFormatterSpec.fromNumberFormat(
            NumberFormat.compactSimpleCurrency());

    final children = <Widget>[
      SizedBox(
          height: 150.0,
          child: charts.TimeSeriesChart(
            seriesList,
            animate: animate,
            selectionModels: [
              charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              )
            ],
            primaryMeasureAxis: charts.NumericAxisSpec(
                tickFormatterSpec: simpleCurrencyFormatter),
            // Optionally pass in a [DateTimeFactory] used by the chart. The factory
            // should create the same type of [DateTime] as the data provided. If none
            // specified, the default creates local date time.
            domainAxis: const charts.DateTimeAxisSpec(
                tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                    day: charts.TimeFormatterSpec(
                        format: 'd', transitionFormat: 'yyyy/MM/dd'))),
            behaviors: [
              // Add the sliding viewport behavior to have the viewport center on the
              // domain that is currently selected.
              charts.SlidingViewport(),
              // A pan and zoom behavior helps demonstrate the sliding viewport
              // behavior by allowing the data visible in the viewport to be adjusted
              // dynamically.
              charts.PanAndZoomBehavior(),
            ],
          )),
    ];

    // If there is a selection, then include the details.
    if (_time.value != null) {
      children.add(Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(_time.value.toString())));
    }
    _measures.value?.forEach((String? series, num value) {
      children.add(Text('${series}: ${value}'));
    });

    return Column(children: children);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      TimeSeriesSales(DateTime(2017, 9, 19), 6800),
      TimeSeriesSales(DateTime(2017, 9, 20), 3000),
      TimeSeriesSales(DateTime(2017, 9, 26), 3000),
      TimeSeriesSales(DateTime(2017, 9, 27), 6800),
      TimeSeriesSales(DateTime(2017, 10, 9), 6800),
      TimeSeriesSales(DateTime(2017, 10, 10), 3000),
      TimeSeriesSales(DateTime(2017, 10, 20), 3000),
      TimeSeriesSales(DateTime(2017, 10, 21), 6800),
      TimeSeriesSales(DateTime(2017, 12, 20), 6800),
      TimeSeriesSales(DateTime(2017, 12, 21), 2500),
      TimeSeriesSales(DateTime(2018, 1, 20), 2500),
      TimeSeriesSales(DateTime(2018, 1, 21), 6800),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

class SelectionCallbackExample extends StatefulWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  SelectionCallbackExample(this.seriesList, {required this.animate});

  /// Creates a [charts.TimeSeriesChart] with sample data and no transition.
  factory SelectionCallbackExample.withSampleData() {
    return SelectionCallbackExample(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  // We need a Stateful widget to build the selection details with the current
  // selection as the state.
  @override
  State<StatefulWidget> createState() => _SelectionCallbackState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      TimeSeriesSales(DateTime(2017, 9, 19), 6800),
      TimeSeriesSales(DateTime(2017, 9, 20), 3000),
      TimeSeriesSales(DateTime(2017, 9, 26), 3000),
      TimeSeriesSales(DateTime(2017, 9, 27), 6800),
      TimeSeriesSales(DateTime(2017, 10, 9), 6800),
      TimeSeriesSales(DateTime(2017, 10, 10), 3000),
      TimeSeriesSales(DateTime(2017, 10, 20), 3000),
      TimeSeriesSales(DateTime(2017, 10, 21), 6800),
      TimeSeriesSales(DateTime(2017, 12, 20), 6800),
      TimeSeriesSales(DateTime(2017, 12, 21), 2500),
      TimeSeriesSales(DateTime(2018, 1, 20), 2500),
      TimeSeriesSales(DateTime(2018, 1, 21), 6800),
      TimeSeriesSales(DateTime(2018, 3, 20), 6800),
      TimeSeriesSales(DateTime(2018, 3, 21), 2200),
      TimeSeriesSales(DateTime(2018, 4, 18), 2200),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class _SelectionCallbackState extends State<SelectionCallbackExample> {
  DateTime? _time;
  Map<String?, num>? _measures;

  // Listens to the underlying selection changes, and updates the information
  // relevant to building the primitive legend like information under the
  // chart.
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    DateTime? time;
    final measures = <String?, num>{};

    // We get the model that updated with a list of [SeriesDatum] which is
    // simply a pair of series & datum.
    //
    // Walk the selection updating the measures map, storing off the sales and
    // series name for each selection point.
    if (selectedDatum.isNotEmpty) {
      time = selectedDatum.first.datum.time;
      for (var datumPair in selectedDatum) {
        measures[datumPair.series.displayName] = datumPair.datum.sales;
      }
    }

    // Request a build.
    setState(() {
      _time = time;
      _measures = measures;
    });
  }

  @override
  Widget build(BuildContext context) {
    // The children consist of a Chart and Text widgets below to hold the info.
    final children = <Widget>[
      SizedBox(
          height: 200.0,
          child: charts.TimeSeriesChart(
            widget.seriesList,
            animate: widget.animate,
            selectionModels: [
              charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              )
            ],
            primaryMeasureAxis: const charts.NumericAxisSpec(
              tickProviderSpec:
                  charts.BasicNumericTickProviderSpec(desiredTickCount: 4),
            ),
            behaviors: [
              charts.SlidingViewport(),
              charts.PanAndZoomBehavior(),
            ],
          )),
    ];

    if (_time != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(DateFormat.yMMMEd().format(_time!)),
        ),
      );
    }
    _measures?.forEach((String? series, num value) {
      children.add(
        Text('価格: ${NumberFormat.simpleCurrency(locale: 'ja').format(value)}'),
      );
    });

    return Column(children: children);
  }
}
