import 'package:weather/data/environment.dart';

class ApiUrlFormater {
  static const _protocol = 'https';
  static const _server = 'openweathermap.org';
  static const _baseUrl = '$_protocol://$_server';
  static const _baseApiUrl = '$_protocol://api.$_server/data/2.5';

  static const _apiKey = Environment.apiKey;
  static const _units = 'metric';

  static String getCurrentWeatherUrl(String cityName) =>
      '$_baseApiUrl/weather?q=$cityName&appid=$_apiKey&units=$_units';

  static String getForecastUrl(String cityName) =>
      '$_baseApiUrl/forecast?q=$cityName&appid=$_apiKey&units=$_units';

  static String getWeatherIconUrl(String iconCode) =>
      '$_baseUrl/img/wn/$iconCode@2x.png';
}
