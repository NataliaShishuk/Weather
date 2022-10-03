import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:weather/src/domain/entities/forecast.dart';
import 'package:weather/src/domain/entities/forecast_element.dart';
import 'package:weather/src/domain/entities/weather.dart';
import 'package:weather/src/presentation/pages/weather_page/components/weather/temperature_line_chart.dart';
import 'package:weather/src/presentation/pages/weather_page/components/weather/today_weather.dart';

class WeatherHeaderSwiper extends StatelessWidget {
  const WeatherHeaderSwiper({
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
      TodayWeather(
        weather: weather,
      ),
      TemperatureLineChart(
        weathers: _getDayForecast(),
        animate: true,
      ),
    ];
  }
}
