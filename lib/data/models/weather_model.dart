import 'package:weather/data/models/main_model.dart';
import 'package:weather/data/models/weather_element_model.dart';
import 'package:weather/domain/entities/weather.dart';

class WeatherModel {
  const WeatherModel({
    required this.cityName,
    required this.weatherElements,
    required this.main,
  });

  final String cityName;
  final List<WeatherElementModel> weatherElements;
  final MainModel main;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        weatherElements: List<WeatherElementModel>.from(json['weather']
            .map((element) => WeatherElementModel.fromJson(element))),
        main: MainModel.fromJson(json['main']),
      );

  Weather toEntity() => Weather(
        cityName: cityName,
        weatherElements:
            weatherElements.map((element) => element.toEntity()).toList(),
        main: main.toEntity(),
      );
}
