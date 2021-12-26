import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/widgets/card_tag.dart';
import 'package:game_sale/widgets/platform_tag.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class GameDetailPage extends HookConsumerWidget {
  GameDetailPage({Key? key}) : super(key: key);

  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;

  final images = [
    'assets/images/elden.webp',
    'assets/images/gt7.webp',
    'assets/images/horizon.webp',
    'assets/images/rainbow.webp'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ゲーム詳細'),
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
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, horizontalIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                images[horizontalIndex],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'エルデンリング',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        PlatformTag(platform: GamePlatform.ps4),
                      ],
                    ),
                    Text(
                      'ELDEN RING',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '2022-12-01',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0),
                                        child: Text(
                                          '/',
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: '22.34GB',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: List<Widget>.generate(2, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CardTag(
                                    text: 'シューティング',
                                    textColor: Colors.black,
                                    backgroundColor: Colors.grey[300]!,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/Z.png',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      '''王となれ
本作は、本格的なダークファンタジーの世界を舞台にしたアクションRPGタイトルです。
広大なフィールドとダンジョン探索による未知の発見。立ちはだかる困難と、それを乗り越えた時の達成感。そして、登場人物たちの思惑が交錯する群像劇をお楽しみいただけます。
・刺激に満ちた広大な世界
多彩なシチュエーションを持つオープンなフィールドと、複雑かつ立体的に作り込まれた巨大ダンジョンがシームレスに繋がる広大な世界。探索の先には、未知の発見による喜びと、高い達成感へと繋がる圧倒的な脅威がプレイヤーを待ち受けます。
・自分だけのキャラクター
プレイヤーキャラクターは外見のカスタマイズだけでなく、身につける武器や防具、魔法を自由に組み合わせることが可能。筋力を高めて屈強な戦士となる、あるいは、魔術を極めるなど、自分のプレイスタイルに合わせてキャラクターを成長させることができます。
・神話から生まれる群像劇
断片的に語られる、重層的な物語。「狭間の地」を舞台に登場人物たちの様々な思惑が交錯する群像劇が展開されます。
・他者と緩やかにつながる独自のオンラインプレイ
他のプレイヤーと直接的に繋がり、一緒に旅をするマルチプレイに加え、他者の存在を感じられる独自の非同期オンライン要素に対応しています。
※本作のPS4™版を既にお持ちの場合、追加費用なしでPS5™版にアップグレードすることが可能です（本製品を購入する必要はありません）。PS4™ディスク版をお持ちの場合、PS5™ダウンロード版のダウンロード/プレイに際しディスクをPS5™本体に挿入いただく必要があるため、ディスクドライブ搭載モデルのPS5™を所有している必要があります。
※各種コンテンツのご利用にはインターネット接続が必要です。
※オンラインマルチプレイをお楽しみいただくにはPlayStation®Plus（有料）への加入が必要です。''',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    )
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
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.favorite_outline),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            new Expanded(child: new SizedBox()),
            IconButton(
              icon: Icon(Icons.share_outlined),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_comment),
        onPressed: () {},
        label: Text('レビュー'),
      ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
          expandedHeight, 'assets/images/elden.webp', roundedContainerHeight),
    );
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGameInfo(),
        ],
      ),
    );
  }

  Widget _buildGameInfo() {
    return Text('title');
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
