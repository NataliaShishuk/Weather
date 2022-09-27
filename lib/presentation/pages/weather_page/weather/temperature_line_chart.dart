import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:weather/presentation/pages/formater.dart';
import 'package:weather/domain/entities/forecast_element.dart';

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
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (weather, _) => weather.date,
            measureFn: (weather, _) => weather.main.temperature,
            data: weathers,
          )
        ],
        animate: animate,
        animationDuration: const Duration(milliseconds: 600),
        primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec: const charts.BasicNumericTickProviderSpec(
            zeroBound: false,
            dataIsInWholeNumbers: true,
          ),
          tickFormatterSpec: charts.BasicNumericTickFormatterSpec((value) =>
              Formater.formatTemperatureWithUnits(value!.toDouble())),
        ),
      ),
    );
  }
}
