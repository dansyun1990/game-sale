import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:intl/intl.dart';

/// セール履歴用のグラフを作成
class SaleHistoryChart extends StatefulWidget {
  const SaleHistoryChart({Key? key, required this.seriesList})
      : super(key: key);

  /// グラフ表示用のセール履歴データ
  final List<charts.Series<dynamic, DateTime>> seriesList;

  @override
  State<StatefulWidget> createState() => _SaleHistoryChartState();
}

class _SaleHistoryChartState extends State<SaleHistoryChart> {
  DateTime? _time;
  Map<String?, num>? _measures;

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    DateTime? time;
    final measures = <String?, num>{};

    if (selectedDatum.isNotEmpty) {
      time = selectedDatum.first.datum.time;
      for (var datumPair in selectedDatum) {
        measures[datumPair.series.displayName] = datumPair.datum.price;
      }
    }

    setState(() {
      _time = time;
      _measures = measures;
    });
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      SizedBox(
          height: 200.0,
          child: charts.TimeSeriesChart(
            widget.seriesList,
            animate: true,
            selectionModels: [
              charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              )
            ],
            domainAxis: charts.DateTimeAxisSpec(
              renderSpec: charts.SmallTickRendererSpec(
                labelStyle: charts.TextStyleSpec(
                    color: Theme.of(context).brightness == Brightness.light
                        ? charts.MaterialPalette.black
                        : charts.MaterialPalette.white),
              ),
            ),
            primaryMeasureAxis: charts.NumericAxisSpec(
              tickProviderSpec: const charts.BasicNumericTickProviderSpec(
                  desiredTickCount: 4),
              renderSpec: charts.SmallTickRendererSpec(
                labelStyle: charts.TextStyleSpec(
                    color: Theme.of(context).brightness == Brightness.light
                        ? charts.MaterialPalette.black
                        : charts.MaterialPalette.white),
              ),
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
        Text(S.of(context).price +
            ' : ' +
            NumberFormat.simpleCurrency(locale: 'ja').format(value)),
      );
    });
    return Column(children: children);
  }
}
