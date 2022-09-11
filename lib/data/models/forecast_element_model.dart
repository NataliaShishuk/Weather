import 'package:weather/data/models/main_model.dart';
import 'package:weather/data/models/weather_element_model.dart';
import 'package:weather/domain/entities/forecast_element.dart';

class ForecastElementModel {
  const ForecastElementModel({
    required this.weatherElements,
    required this.main,
    required this.date,
  });

  final List<WeatherElementModel> weatherElements;
  final MainModel main;
  final String date;

  factory ForecastElementModel.fromJson(Map<String, dynamic> json) => ForecastElementModel(
        weatherElements: List<WeatherElementModel>.from(json['weather']
            .map((element) => WeatherElementModel.fromJson(element))),
        main: MainModel.fromJson(json['main']),
        date: json['dt_txt'],
      );

  ForecastElement toEntity() => ForecastElement(
        weatherElements:
            weatherElements.map((element) => element.toEntity()).toList(),
        main: main.toEntity(),
        date: date,
      );
}
