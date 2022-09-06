import 'package:weather/domain/entities/main.dart';
import 'package:weather/domain/entities/weather_element.dart';

class Weather {
  const Weather({
    required this.cityName,
    required this.weatherElements,
    required this.main,
  });

  final String cityName;
  final List<WeatherElement> weatherElements;
  final Main main;
}
