import 'dart:convert';

import 'package:weather/data/datasources/weather_data_source.dart';
import 'package:weather/data/exceptions/server_exception.dart';
import 'package:weather/data/helpers/api_url_formater.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiWeatherDataSource implements WeatherDataSource {
  final http.Client client;

  ApiWeatherDataSource({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    var url = ApiUrlFormater.getCurrentWeatherByCity(cityName);
    var response = await client.get(url);

    if (!_isResponseSuccess(response)) {
      throw ServerException(
          'Error occured during sending request: ${response.body}');
    }

    return WeatherModel.fromJson(json.decode(response.body));
  }

  static bool _isResponseSuccess(http.Response response) =>
      response.statusCode == 200;
}
