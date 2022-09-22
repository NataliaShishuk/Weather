import 'dart:io';

import 'package:weather/data/exceptions/server_exception.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/result.dart';

class GetCurrentWeather {
  const GetCurrentWeather({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  Future<Result<Weather, Failure>> execute(String cityName) async {
    try {
      final weather = await weatherRepository.getCurrentWeather(cityName);

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
