import 'dart:io';

import 'package:weather/data/exceptions/server_exception.dart';
import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/result.dart';

class GetForecast {
  const GetForecast({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  Future<Result<Forecast, Failure>> execute(String cityName) async {
    try {
      final weather = await weatherRepository.getForecast(cityName);

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
}
