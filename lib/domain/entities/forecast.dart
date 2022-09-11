import 'package:weather/domain/entities/forecast_element.dart';

class Forecast {
  const Forecast({
    required this.forecastElements,
  });

  final List<ForecastElement> forecastElements;
}
