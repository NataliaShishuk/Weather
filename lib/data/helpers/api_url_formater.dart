import 'package:weather/data/environment.dart';

class ApiUrlFormater {
  static const server = 'openweathermap.org';
  static const baseApiUrl = 'https://api.$server/data/2.5';
  static const apiKey = Environment.apiKey;
  static const langCode = 'ru';

  static String getCurrentWeatherByCity(String cityName) =>
      '$baseApiUrl/weather?q=$cityName&appid=$apiKey&lang=$langCode&units=metric';

  static String getWeatherIconUrl(String iconCode) =>
      'https://$server/img/wn/$iconCode@2x.png';
}
