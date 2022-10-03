import 'package:flutter/material.dart';
import 'package:weather/src/domain/entities/forecast.dart';
import 'package:weather/src/domain/entities/forecast_element.dart';
import 'package:weather/src/presentation/pages/weather_page/components/forecast/forecast_card.dart';

class DailyForecastListView extends StatelessWidget {
  const DailyForecastListView({
    super.key,
    required this.forecast,
  });

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final dailyForecastElements = _getDailyForecast(forecast);

    return SizedBox(
      height: 215,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: dailyForecastElements.length,
        itemBuilder: (context, index) =>
            ForecastCard(forecastElement: dailyForecastElements[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
      ),
    );
  }

  List<ForecastElement> _getDailyForecast(Forecast forecast) {
    const int itemsPerDay = 8;
    final result = <ForecastElement>[];

    for (var index = itemsPerDay - 1;
        index < forecast.forecastElements.length;
        index += itemsPerDay) {
      result.add(forecast.forecastElements[index]);
    }

    return result;
  }
}
