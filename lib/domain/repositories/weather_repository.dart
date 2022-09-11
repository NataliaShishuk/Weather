import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/result.dart';

abstract class WeatherRepository {
  Future<Result<Weather, Failure>> getCurrentWeather(String cityName);

  Future<Result<Forecast, Failure>> getForecast(String cityName);
}
