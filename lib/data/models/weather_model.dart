import 'package:weather/data/models/clouds_model.dart';
import 'package:weather/data/models/main_model.dart';
import 'package:weather/data/models/sys_model.dart';
import 'package:weather/data/models/weather_element_model.dart';
import 'package:weather/data/models/wind_model.dart';
import 'package:weather/domain/entities/weather.dart';

class WeatherModel {
  const WeatherModel({
    required this.cityName,
    required this.visibility,
    required this.weatherElements,
    required this.main,
    required this.sys,
    required this.wind,
    required this.clouds,
  });

  final String cityName;
  final double visibility;
  final List<WeatherElementModel> weatherElements;
  final MainModel main;
  final SysModel sys;
  final WindModel wind;
  final CloudsModel clouds;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        visibility: json['visibility'].toDouble(),
        weatherElements: List<WeatherElementModel>.from(json['weather']
            .map((element) => WeatherElementModel.fromJson(element))),
        main: MainModel.fromJson(json['main']),
        sys: SysModel.fromJson(json['sys']),
        wind: WindModel.fromJson(json['wind']),
        clouds: CloudsModel.fromJson(json['clouds']),
      );

  Weather toEntity() => Weather(
        cityName: cityName,
        visibility: visibility,
        weatherElements:
            weatherElements.map((element) => element.toEntity()).toList(),
        main: main.toEntity(),
        sys: sys.toEntity(),
        wind: wind.toEntity(),
        clouds: clouds.toEntity(),
      );
}
