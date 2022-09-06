import 'package:weather/data/environment.dart';

class ApiUrlFormater {
  static const server = 'openweathermap.org';
  static const baseApiUrl = 'https://api.$server/data/2.5';
  static final apiKey = Environment.apiKey;
  static final langCode = Environment.languageCode;

  static String getCurrentWeatherByCity(String cityName) =>
      '$baseApiUrl/weather?q=$cityName&appid=$apiKey&lang=$langCode&units=metric';

  static String getWeatherIconUrl(String iconCode) =>
      'https://$server/img/wn/$iconCode@2x.png';
}
