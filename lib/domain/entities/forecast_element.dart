import 'package:weather/domain/entities/main.dart';
import 'package:weather/domain/entities/weather_element.dart';

class ForecastElement {
  const ForecastElement({
    required this.weatherElements,
    required this.main,
    required this.date,
  });

  final List<WeatherElement> weatherElements;
  final Main main;
  final DateTime date;
}
