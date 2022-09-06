import 'package:weather/data/environment.dart';

class ApiUrlFormater {
  static const server = 'https://api.openweathermap.org';
  static final apiKey = Environment.apiKey;
  static final langCode = Environment.languageCode;

  static Uri getCurrentWeatherByCity(String cityName) {
    var url =
        '$server/data/2.5/weather?q=$cityName&appid=$apiKey&lang=$langCode&units=metric';

    return Uri.parse(url);
  }
}
