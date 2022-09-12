import 'package:flutter/material.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/app_colors.dart';
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
            style: const TextStyle(
              fontSize: 60,
              color: AppColors.primaryTextColor,
            ),
          ),
          Text(
            'Feels like ${WeatherHelper.getTemperatureFormat(weather.main.feelsLike)}',
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            weather.weatherElements.first.main,
            style: const TextStyle(
              fontSize: 25,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Today · ${WeatherHelper.getMonthWeekdayDateFormat(DateTime.now())}',
            style: const TextStyle(
              color: AppColors.secondaryTextColor,
              fontSize: 15,
            ),
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
