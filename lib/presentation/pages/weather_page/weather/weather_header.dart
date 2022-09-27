import 'package:flutter/material.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/pages/formater.dart';
import 'package:weather/presentation/pages/weather_page/weather_icon.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({
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
            iconUrl: weather.weatherElements.first.iconUrl,
            size: 150,
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
              fontSize: 25,
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
