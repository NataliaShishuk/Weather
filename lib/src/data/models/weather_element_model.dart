import 'package:weather/src/domain/entities/weather_element.dart';

class WeatherElementModel {
  const WeatherElementModel({
    required this.main,
    required this.description,
    required this.iconCode,
  });

  final String main;
  final String description;
  final String iconCode;

  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      WeatherElementModel(
        main: json['main'],
        description: json['description'],
        iconCode: json['icon'],
      );

  WeatherElement toEntity() => WeatherElement(
        main: main,
        description: description,
        iconCode: iconCode,
      );
}
