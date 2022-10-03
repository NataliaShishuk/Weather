import 'dart:convert';

import 'package:weather/src/data/datasources/weather_data_source.dart';
import 'package:weather/src/data/exceptions/server_exception.dart';
import 'package:weather/src/data/models/forecast_model.dart';
import 'package:weather/src/data/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather/src/data/providers/api_weather_url_provider.dart';

class ApiWeatherDataSource implements WeatherDataSource {
  const ApiWeatherDataSource({
    required this.client,
    required this.apiWeatherUrlProvider,
  });

  final http.Client client;
  final ApiWeatherUrlProvider apiWeatherUrlProvider;

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final url = apiWeatherUrlProvider.getCurrentWeatherUrl(cityName);
    final response = await client.get(url);

    if (!_isResponseSuccess(response)) {
      throw ServerException();
    }

    return WeatherModel.fromJson(json.decode(response.body));
  }

  @override
  Future<ForecastModel> getForecast(String cityName) async {
    final url = apiWeatherUrlProvider.getForecastUrl(cityName);
    final response = await client.get(url);

    if (!_isResponseSuccess(response)) {
      throw ServerException();
    }

    return ForecastModel.fromJson(json.decode(response.body));
  }

  static bool _isResponseSuccess(http.Response response) =>
      response.statusCode == 200;
}
