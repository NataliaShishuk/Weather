import 'dart:io';

import 'package:weather/data/datasources/weather_data_source.dart';
import 'package:weather/data/exceptions/server_exception.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/weather_result.dart';

class ApiWeatherRepository implements WeatherRepository {
  ApiWeatherRepository(this.weatherDataSource);

  final WeatherDataSource weatherDataSource;

  @override
  Future<WeatheResult> getCurrentWeather(String cityName) async {
    try {
      final weatherModel = await weatherDataSource.getCurrentWeather(cityName);
      final weather = weatherModel.toEntity();

      return WeatheResult.success(weather);
    } on ServerException {
      return WeatheResult.fail('Error occured during sending request.');
    } on SocketException {
      return WeatheResult.fail('Failed to conected to the network.');
    } catch (e) {
      return WeatheResult.fail('Something went wrong.');
    }
  }
}
