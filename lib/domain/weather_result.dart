import 'package:weather/domain/entities/weather.dart';

class WeatheResult {
  const WeatheResult({
    required this.weather,
    required this.isSuccess,
    required this.errorMessage,
  });

  final Weather? weather;
  final bool isSuccess;
  final String? errorMessage;

  factory WeatheResult.success(Weather weather) => WeatheResult(
        weather: weather,
        isSuccess: true,
        errorMessage: null,
      );

  factory WeatheResult.fail(String errorMessage) => WeatheResult(
        weather: null,
        isSuccess: false,
        errorMessage: errorMessage,
      );
}
