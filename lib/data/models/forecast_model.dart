import 'package:weather/data/models/forecast_element_model.dart';
import 'package:weather/domain/entities/forecast.dart';

class ForecastModel {
  const ForecastModel({
    required this.forecastElements,
  });

  final List<ForecastElementModel> forecastElements;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        forecastElements: List<ForecastElementModel>.from(json['list']
            .map((element) => ForecastElementModel.fromJson(element))),
      );

  Forecast toEntity() => Forecast(
        forecastElements:
            forecastElements.map((element) => element.toEntity()).toList(),
      );
}
