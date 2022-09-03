import 'package:weather/data/models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}
