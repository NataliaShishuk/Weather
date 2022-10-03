import 'package:weather/src/data/models/forecast_model.dart';
import 'package:weather/src/data/models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);

  Future<ForecastModel> getForecast(String cityName);
}
