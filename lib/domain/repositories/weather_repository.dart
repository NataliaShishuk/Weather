import 'package:weather/domain/weather_result.dart';

abstract class WeatherRepository {
  Future<WeatherResult> getCurrentWeather(String cityName);
}
