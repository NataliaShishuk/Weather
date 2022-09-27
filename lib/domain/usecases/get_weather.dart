import 'dart:io';

import 'package:weather/data/exceptions/server_exception.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/result.dart';

class GetWeather {
  const GetWeather({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  Future<Result<List, Failure>> execute(String cityName) async {
    try {
      final weather = await weatherRepository.getCurrentWeather(cityName);
      final forecast = await weatherRepository.getForecast(cityName);

      return Result.success([
        weather,
        forecast,
      ]);
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
