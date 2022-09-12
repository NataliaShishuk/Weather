import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/forecast_element.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/result.dart';
import 'package:weather/domain/usecases/get_forecast.dart';
import 'package:weather/presentation/app_colors.dart';
import 'package:weather/presentation/pages/weather_page/forecast/forecast_card.dart';
import 'package:weather/injection.dart' as di;

class DailyForecast extends StatelessWidget {
  DailyForecast({
    super.key,
    required this.cityName,
  });

  final GetForecast _getForecast = di.locator<GetForecast>();
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder<Result<Forecast, Failure>>(
      future: _getForecastByCity(cityName),
      waiting: (context) => const CircularProgressIndicator(),
      builder: (context, data) {
        final forecastResult = data!;

        if (forecastResult.isSuccess) {
          final forecast = forecastResult.result!;

          final dailyForecastElements =
              _getDailyForecast(forecast.forecastElements);

          return SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dailyForecastElements.length,
              itemBuilder: (context, index) =>
                  ForecastCard(forecastElement: dailyForecastElements[index]),
            ),
          );
        } else {
          return const Center(
            child: Icon(
              Icons.error_outline,
              color: AppColors.primaryTextColor,
              size: 150,
            ),
          );
        }
      },
    );
  }

  List<ForecastElement> _getDailyForecast(
      List<ForecastElement> forecastElements) {
    const int itemsPerDay = 8;
    final result = <ForecastElement>[];

    for (var index = itemsPerDay - 1;
        index < forecastElements.length;
        index += itemsPerDay) {
      result.add(forecastElements[index]);
    }

    return result;
  }

  Future<Result<Forecast, Failure>> _getForecastByCity(String cityName) =>
      _getForecast.execute(cityName);
}
