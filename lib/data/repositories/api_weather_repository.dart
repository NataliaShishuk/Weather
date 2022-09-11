import 'dart:io';

import 'package:weather/data/datasources/weather_data_source.dart';
import 'package:weather/data/exceptions/server_exception.dart';
import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/result.dart';

class ApiWeatherRepository implements WeatherRepository {
  const ApiWeatherRepository({
    required this.weatherDataSource,
  });

  final WeatherDataSource weatherDataSource;

  @override
  Future<Result<Weather, Failure>> getCurrentWeather(String cityName) async {
    try {
      final weatherModel = await weatherDataSource.getCurrentWeather(cityName);
      final weather = weatherModel.toEntity();

      return Result.success(weather);
    } on ServerException {
      return Result.fail(const ServerFailure(
          message: 'Error occured during sending request on the server.'));
    } on SocketException {
      return Result.fail(const ConnectionFailure(
          message: 'Failed to conected to the network.'));
    } catch (e) {
      return Result.fail(const ServerFailure(message: 'Something went wrong.'));
    }
  }

  @override
  Future<Result<Forecast, Failure>> getForecast(String cityName) async {
    try {
      final forecastModel = await weatherDataSource.getForecast(cityName);
      final forecast = forecastModel.toEntity();

      return Result.success(forecast);
    } on ServerException {
      return Result.fail(const ServerFailure(
          message: 'Error occured during sending request on the server.'));
    } on SocketException {
      return Result.fail(const ConnectionFailure(
          message: 'Failed to conected to the network.'));
    } catch (e) {
      return Result.fail(const ServerFailure(message: 'Something went wrong.'));
    }
  }
}
