import 'package:weather/domain/weather_result.dart';

abstract class WeatherRepository {
  Future<WeatheResult> getCurrentWeather(String cityName);
}
