import 'dart:convert';

import 'package:weather/data/datasources/weather_data_source.dart';
import 'package:weather/data/exceptions/server_exception.dart';
import 'package:weather/data/helpers/api_url_formater.dart';
import 'package:weather/data/models/forecast_model.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiWeatherDataSource implements WeatherDataSource {
  const ApiWeatherDataSource({
    required this.client,
  });

  final http.Client client;

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final url = ApiUrlFormater.getCurrentWeatherUrl(cityName);
    final response = await client.get(Uri.parse(url));

    if (!_isResponseSuccess(response)) {
      throw ServerException();
    }

    return WeatherModel.fromJson(json.decode(response.body));
  }

  @override
  Future<ForecastModel> getForecast(String cityName) async {
    final url = ApiUrlFormater.getForecastUrl(cityName);
    final response = await client.get(Uri.parse(url));

    if (!_isResponseSuccess(response)) {
      throw ServerException();
    }

    return ForecastModel.fromJson(json.decode(response.body));
  }

  static bool _isResponseSuccess(http.Response response) =>
      response.statusCode == 200;
}
