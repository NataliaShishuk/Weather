import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:weather/src/presentation/utils/formater.dart';
import 'package:weather/src/domain/entities/forecast_element.dart';

class TemperatureLineChart extends StatelessWidget {
  const TemperatureLineChart({
    super.key,
    required this.weathers,
    this.animate,
  });

  final List<ForecastElement> weathers;
  final bool? animate;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme.primary;
    final primaryColor = charts.ColorUtil.fromDartColor(themeColor);
    final lineColor =
        charts.ColorUtil.fromDartColor(themeColor.withOpacity(0.2));

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: charts.TimeSeriesChart(
        [
          /// x axis - date
          /// y axis - temperature
          charts.Series<ForecastElement, DateTime>(
            id: 'TemperatureLineChart',
            colorFn: (_, __) => primaryColor,
            domainFn: (weather, _) => weather.date,
            measureFn: (weather, _) => weather.main.temperature,
            data: weathers,
            fillColorFn: (datum, index) => primaryColor,
          )
        ],
        animate: animate,
        animationDuration: const Duration(milliseconds: 600),
        domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: charts.TextStyleSpec(
              color: primaryColor,
            ),
            lineStyle: charts.LineStyleSpec(
              color: primaryColor,
            ),
          ),
        ),
        primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
            labelStyle: charts.TextStyleSpec(
              color: primaryColor,
            ),
            lineStyle: charts.LineStyleSpec(
              color: lineColor,
            ),
          ),
          tickProviderSpec: const charts.BasicNumericTickProviderSpec(
            zeroBound: false,
            dataIsInWholeNumbers: true,
          ),
          tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
            (value) => Formater.formatTemperatureWithUnits(value!.toDouble()),
          ),
        ),
      ),
    );
  }
}
