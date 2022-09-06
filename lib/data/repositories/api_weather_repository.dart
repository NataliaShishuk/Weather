import 'dart:io';

import 'package:weather/data/datasources/weather_data_source.dart';
import 'package:weather/data/exceptions/server_exception.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/weather_result.dart';

class ApiWeatherRepository implements WeatherRepository {
  ApiWeatherRepository(this.weatherDataSource);

  final WeatherDataSource weatherDataSource;

  @override
  Future<WeatherResult> getCurrentWeather(String cityName) async {
    try {
      final weatherModel = await weatherDataSource.getCurrentWeather(cityName);
      final weather = weatherModel.toEntity();

      return WeatherResult.success(weather);
    } on ServerException {
      return WeatherResult.fail('Error occured during sending request.');
    } on SocketException {
      return WeatherResult.fail('Failed to conected to the network.');
    } catch (e) {
      return WeatherResult.fail('Something went wrong.');
    }
  }
}
