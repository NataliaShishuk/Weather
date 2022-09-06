import 'package:weather/domain/entities/main.dart';

class MainModel {
  const MainModel({
    required this.temperature,
    required this.feelsLike,
    required this.minTemperature,
    required this.maxTemperature,
    required this.pressure,
    required this.humidity,
  });

  final double temperature;
  final double feelsLike;
  final double minTemperature;
  final double maxTemperature;
  final double pressure;
  final double humidity;

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
        temperature: json['temp'],
        feelsLike: json['feels_like'],
        minTemperature: json['temp_min'],
        maxTemperature: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity'],
      );

  Main toEntity() => Main(
        temperature: temperature,
        feelsLike: feelsLike,
        minTemperature: minTemperature,
        maxTemperature: maxTemperature,
        pressure: pressure,
        humidity: humidity,
      );
}
