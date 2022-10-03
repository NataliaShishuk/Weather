import 'package:weather/src/data/datasources/weather_data_source.dart';
import 'package:weather/src/domain/entities/forecast.dart';
import 'package:weather/src/domain/entities/weather.dart';
import 'package:weather/src/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl({
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
