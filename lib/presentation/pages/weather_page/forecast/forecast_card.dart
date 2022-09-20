import 'package:flutter/material.dart';
import 'package:weather/domain/entities/forecast_element.dart';
import 'package:weather/domain/entities/weather_element.dart';
import 'package:weather/presentation/pages/weather_page/section.dart';
import 'package:weather/presentation/weather_helper.dart';
import 'package:weather/presentation/pages/weather_page/weather_icon.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    super.key,
    required this.forecastElement,
  });

  final ForecastElement forecastElement;

  WeatherElement get mainWeatherElement =>
      forecastElement.weatherElements.first;

  @override
  Widget build(BuildContext context) {
    return Section(
      width: 150,
      onPressed: () {},
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            WeatherHelper.getMonthWeekdayDateFormat(forecastElement.date),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          WeatherIcon(
            iconUrl: mainWeatherElement.iconUrl,
            size: 80,
          ),
          const SizedBox(height: 15),
          Text(
            mainWeatherElement.main,
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            WeatherHelper.getTemperatureFormat(
                forecastElement.main.temperature),
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
