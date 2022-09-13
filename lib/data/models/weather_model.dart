import 'package:weather/data/models/main_model.dart';
import 'package:weather/data/models/sys_model.dart';
import 'package:weather/data/models/weather_element_model.dart';
import 'package:weather/domain/entities/weather.dart';

class WeatherModel {
  const WeatherModel({
    required this.cityName,
    required this.weatherElements,
    required this.main,
    required this.sys,
  });

  final String cityName;
  final List<WeatherElementModel> weatherElements;
  final MainModel main;
  final SysModel sys;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        weatherElements: List<WeatherElementModel>.from(json['weather']
            .map((element) => WeatherElementModel.fromJson(element))),
        main: MainModel.fromJson(json['main']),
        sys: SysModel.fromJson(json['sys']),
      );

  Weather toEntity() => Weather(
        cityName: cityName,
        weatherElements:
            weatherElements.map((element) => element.toEntity()).toList(),
        main: main.toEntity(),
        sys: sys.toEntity(),
      );
}
