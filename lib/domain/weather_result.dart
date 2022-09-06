import 'package:weather/domain/entities/weather.dart';

class WeatherResult {
  const WeatherResult({
    required this.weather,
    required this.isSuccess,
    required this.errorMessage,
  });

  final Weather? weather;
  final bool isSuccess;
  final String? errorMessage;

  factory WeatherResult.success(Weather weather) => WeatherResult(
        weather: weather,
        isSuccess: true,
        errorMessage: null,
      );

  factory WeatherResult.fail(String errorMessage) => WeatherResult(
        weather: null,
        isSuccess: false,
        errorMessage: errorMessage,
      );
}
