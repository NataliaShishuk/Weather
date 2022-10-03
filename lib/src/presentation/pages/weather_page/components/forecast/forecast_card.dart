import 'package:flutter/material.dart';
import 'package:weather/src/domain/entities/forecast_element.dart';
import 'package:weather/src/domain/entities/weather_element.dart';
import 'package:weather/src/presentation/pages/weather_page/components/custom_card.dart';
import 'package:weather/src/presentation/utils/formater.dart';
import 'package:weather/src/presentation/pages/weather_page/components/weather_icon.dart';

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
    return CustomCard(
      width: 150,
      onPressed: () {},
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            Formater.formatDateToMonthWeekday(forecastElement.date),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          WeatherIcon(
            iconCode: mainWeatherElement.iconCode,
            size: 50,
          ),
          const SizedBox(height: 15),
          Text(
            mainWeatherElement.main,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            Formater.formatTemperatureWithUnits(
                forecastElement.main.temperature),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
