import 'package:weather/domain/entities/main.dart';
import 'package:weather/domain/entities/sys.dart';
import 'package:weather/domain/entities/weather_element.dart';

class Weather {
  const Weather({
    required this.cityName,
    required this.weatherElements,
    required this.main,
    required this.sys,
  });

  final String cityName;
  final List<WeatherElement> weatherElements;
  final Main main;
  final Sys sys;
}
