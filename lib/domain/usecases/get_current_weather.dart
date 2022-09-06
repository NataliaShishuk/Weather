import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/weather_result.dart';

class GetCurrentWeather {
  const GetCurrentWeather(this.weatherRepository);

  final WeatherRepository weatherRepository;

  Future<WeatherResult> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
