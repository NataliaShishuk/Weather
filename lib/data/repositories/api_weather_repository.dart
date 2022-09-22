import 'package:weather/data/datasources/weather_data_source.dart';
import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

class ApiWeatherRepository implements WeatherRepository {
  const ApiWeatherRepository({
    required this.weatherDataSource,
  });

  final WeatherDataSource weatherDataSource;

  @override
  Future<Weather> getCurrentWeather(String cityName) async {
    final weatherModel = await weatherDataSource.getCurrentWeather(cityName);
    final weather = weatherModel.toEntity();

    return weather;
  }

  @override
  Future<Forecast> getForecast(String cityName) async {
    final forecastModel = await weatherDataSource.getForecast(cityName);
    final forecast = forecastModel.toEntity();

    return forecast;
  }
}
