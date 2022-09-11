import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/result.dart';

class GetForecast {
  const GetForecast({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  Future<Result<Forecast, Failure>> execute(String cityName) {
    return weatherRepository.getForecast(cityName);
  }
}
