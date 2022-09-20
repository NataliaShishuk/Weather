import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/forecast_element.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/result.dart';
import 'package:weather/domain/usecases/get_forecast.dart';
import 'package:weather/injection.dart' as di;
import 'package:weather/presentation/pages/weather_page/forecast/forecast_card.dart';

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
      waiting: (context) => _dailyForecastLoading(context),
      builder: (context, data) => _buildDayliForecast(context, data!),
    );
  }

  Future<Result<Forecast, Failure>> _getForecastByCity(String cityName) {
    return _getForecast.execute(cityName);
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

  Widget _buildDayliForecast(
      BuildContext context, Result<Forecast, Failure> forecastResult) {
    if (forecastResult.isSuccess) {
      final forecast = forecastResult.result!;

      final dailyForecastElements =
          _getDailyForecast(forecast.forecastElements);

      return _dailyForecastHasData(dailyForecastElements);
    } else {
      return _dailyForecastError(context);
    }
  }

  Widget _dailyForecastLoading(BuildContext context) {
    return SpinKitFadingCircle(color: Theme.of(context).colorScheme.primary);
  }

  Widget _dailyForecastHasData(List<ForecastElement> dailyForecastElements) {
    return SizedBox(
      height: 230,
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

  Widget _dailyForecastError(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error_outline,
        color: Theme.of(context).colorScheme.primary,
        size: 150,
      ),
    );
  }
}
