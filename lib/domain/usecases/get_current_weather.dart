import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/result.dart';

class GetCurrentWeather {
  const GetCurrentWeather({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  Future<Result<Weather, Failure>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
