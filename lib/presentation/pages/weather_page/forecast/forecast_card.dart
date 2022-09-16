import 'package:flutter/material.dart';
import 'package:weather/domain/entities/forecast_element.dart';
import 'package:weather/domain/entities/weather_element.dart';
import 'package:weather/presentation/app_colors.dart';
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
    return SizedBox(
      width: 150,
      child: Card(
        margin: EdgeInsets.zero,
        semanticContainer: true,
        color: Colors.transparent,
        child: InkWell(
          highlightColor: AppColors.primmaryBackgroundColor.withAlpha(30),
          splashColor: AppColors.primmaryBackgroundColor.withAlpha(30),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            color: AppColors.secondaryBackgroundColor,
            child: Column(
              children: [
                const SizedBox(height: 5),
                Text(
                  WeatherHelper.getMonthWeekdayDateFormat(forecastElement.date),
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 10),
                WeatherIcon(
                  iconUrl: mainWeatherElement.iconUrl,
                  size: 80,
                ),
                const SizedBox(height: 15),
                Text(
                  mainWeatherElement.main,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  WeatherHelper.getTemperatureFormat(
                      forecastElement.main.temperature),
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
