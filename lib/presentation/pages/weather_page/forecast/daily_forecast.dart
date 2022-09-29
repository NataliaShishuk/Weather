import 'package:flutter/material.dart';
import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/forecast_element.dart';
import 'package:weather/presentation/pages/weather_page/forecast/forecast_card.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({
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
