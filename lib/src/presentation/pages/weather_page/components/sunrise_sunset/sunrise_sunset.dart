import 'package:flutter/material.dart';
import 'package:weather/src/presentation/pages/weather_page/components/custom_card.dart';
import 'package:weather/src/presentation/pages/weather_page/components/sunrise_sunset/sun_card.dart';
import 'package:weather_icons/weather_icons.dart';

class SunriseSunset extends StatelessWidget {
  const SunriseSunset({
    super.key,
    required this.sunriseDate,
    required this.sunsetDate,
  });

  final DateTime sunriseDate;
  final DateTime sunsetDate;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SunCard(
            title: 'Sunrise',
            date: sunriseDate,
            iconData: WeatherIcons.sunrise,
          ),
          SunCard(
            title: 'Sunset',
            date: sunsetDate,
            iconData: WeatherIcons.sunset,
          ),
        ],
      ),
    );
  }
}
