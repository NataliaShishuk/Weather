import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        semanticContainer: true,
        color: AppColors.secondaryBackgroundColor,
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
                  _getTemperatureFormat(forecastElement.main.temperature),
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

    return Container(
      color: AppColors.primmaryBackgroundColor,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Text(
                DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY)
                    .format(DateTime.now())
                    .toString(),
                style: const TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  CachedNetworkImage(
                    width: 80,
                    fit: BoxFit.fill,
                    imageUrl: forecastElement.weatherElements.first.iconUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ],
              ),
              Text(
                forecastElement.weatherElements.first.main,
                style: const TextStyle(
                  fontSize: 20,
                  //color: color,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Text(
                _getTemperatureFormat(forecastElement.main.temperature),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  int _roundTemperature(double temperature) => temperature.round();

  String _getCurrentUnits() => '°';

  String _getTemperatureFormat(double temperature) =>
      '${_roundTemperature(temperature)}${_getCurrentUnits()}';

  String _getDateFormat() => DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY)
      .format(DateTime.now())
      .toString();
}
