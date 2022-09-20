import 'package:flutter/material.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/weather_helper.dart';
import 'package:weather/presentation/pages/weather_page/weather/weather_location.dart';
import 'package:weather/presentation/pages/weather_page/weather_icon.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({
    super.key,
    required this.weather,
    required this.locationOnPressed,
  });

  final Weather weather;
  final Function() locationOnPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 35),
          WeatherIcon(
            iconUrl: weather.weatherElements.first.iconUrl,
            size: 150,
          ),
          Text(
            WeatherHelper.getTemperatureFormat(weather.main.temperature),
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
              'Feels like ${WeatherHelper.getTemperatureFormat(weather.main.feelsLike)}',),
          const SizedBox(height: 20),
          Text(
            weather.weatherElements.first.main,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 25),
          ),
          const SizedBox(height: 15),
          Text(
            'Today · ${WeatherHelper.getMonthWeekdayDateFormat(DateTime.now())}',
          ),
          const SizedBox(height: 5),
          WeatherLocation(
            cityName: weather.cityName,
            onPressed: locationOnPressed,
          )
        ],
      ),
    );
  }
}
