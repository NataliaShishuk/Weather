import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeather(String cityName);

  Future<Forecast> getForecast(String cityName);
}
