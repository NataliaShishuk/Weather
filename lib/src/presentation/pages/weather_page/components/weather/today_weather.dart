import 'package:flutter/material.dart';
import 'package:weather/src/domain/entities/weather.dart';
import 'package:weather/src/presentation/utils/formater.dart';
import 'package:weather/src/presentation/pages/weather_page/components/weather_icon.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 5),
          WeatherIcon(
            iconCode: weather.weatherElements.first.iconCode,
            size: 100,
          ),
          Text(
            Formater.formatTemperatureWithUnits(weather.main.temperature),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 60,
            ),
          ),
          Text(
            'Feels like ${Formater.formatTemperatureWithUnits(weather.main.feelsLike)}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            weather.weatherElements.first.main,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 21,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Today · ${Formater.formatDateToMonthWeekday(DateTime.now())}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
