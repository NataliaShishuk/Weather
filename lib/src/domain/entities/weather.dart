import 'package:weather/src/domain/entities/clouds.dart';
import 'package:weather/src/domain/entities/main.dart';
import 'package:weather/src/domain/entities/sys.dart';
import 'package:weather/src/domain/entities/weather_element.dart';
import 'package:weather/src/domain/entities/wind.dart';

class Weather {
  const Weather({
    required this.cityName,
    required this.visibility,
    required this.weatherElements,
    required this.main,
    required this.sys,
    required this.wind,
    required this.clouds,
  });

  final String cityName;
  final double visibility;
  final List<WeatherElement> weatherElements;
  final Main main;
  final Sys sys;
  final Wind wind;
  final Clouds clouds;
}
