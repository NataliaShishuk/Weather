import 'package:flutter/material.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/pages/formater.dart';
import 'package:weather/presentation/pages/weather_page/details/details_card.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 246,
      child: GridView.extent(
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        maxCrossAxisExtent: 120,
        primary: false,
        children: [
          DetailsCard(
            icon: const Icon(WeatherIcons.thermometer),
            title: 'Feels like',
            text: Formater.formatTemperatureWithUnits(weather.main.feelsLike),
          ),
          DetailsCard(
            icon: const Icon(WeatherIcons.strong_wind),
            title: 'Wind',
            text:
                '${_convertMsToKh(weather.wind.speed).toStringAsFixed(1)} km/h',
            tooltipMessage: 'Wind speed',
          ),
          DetailsCard(
            icon: const Icon(WeatherIcons.humidity),
            title: 'Humidity',
            text: '${weather.main.humidity.round()} %',
          ),
          DetailsCard(
            icon: const Icon(WeatherIcons.barometer),
            title: 'Pressure',
            text:
                '${_convertHpaToIn(weather.main.pressure).toStringAsFixed(2)} In',
            tooltipMessage: 'Atmospheric pressure',
          ),
          DetailsCard(
            icon: const Icon(Icons.visibility_outlined),
            title: 'Visibility',
            text: weather.visibility.round().toString(),
            tooltipMessage: 'The maximum value of the visibility is 10km',
          ),
          DetailsCard(
            icon: const Icon(WeatherIcons.cloud),
            title: 'Clouds',
            text: '${weather.clouds.all.round()} %',
            tooltipMessage: 'Cloudiness',
          ),
        ],
      ),
    );
  }

  static double _convertHpaToIn(double value) {
    return 0.02953 * value;
  }

  static double _convertMsToKh(double value) {
    return 3.6 * value;
  }
}