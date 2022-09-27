import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/forecast_element.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/pages/weather_page/weather/temperature_line_chart.dart';
import 'package:weather/presentation/pages/weather_page/weather/weather_header.dart';

class WeatherSwiper extends StatelessWidget {
  const WeatherSwiper({
    super.key,
    required this.weather,
    required this.forecast,
  });

  final Weather weather;
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final swiperWidgets = _getSwiperWidgets();

    return SizedBox(
      height: 380,
      child: Swiper(
        itemBuilder: (context, index) => swiperWidgets[index],
        itemCount: swiperWidgets.length,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).colorScheme.secondary.withAlpha(90),
          ),
        ),
      ),
    );
  }

  List<ForecastElement> _getDayForecast() {
    return forecast.forecastElements.take(7).toList();
  }

  List<Widget> _getSwiperWidgets() {
    return <Widget>[
      WeatherHeader(
        weather: weather,
      ),
      TemperatureLineChart(
        weathers: _getDayForecast(),
        animate: true,
      ),
    ];
  }
}
