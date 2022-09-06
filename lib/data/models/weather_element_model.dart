import 'package:weather/domain/entities/weather_element.dart';

class WeatherElementModel {
  const WeatherElementModel({
    required this.main,
    required this.description,
    required this.icon,
  });

  final String main;
  final String description;
  final String icon;

  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      WeatherElementModel(
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );

  WeatherElement toEntity() => WeatherElement(
        main: main,
        description: description,
        icon: icon,
      );
}
