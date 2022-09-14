abstract class WeatherUrlProvider {
  Uri getCurrentWeatherUrl(String cityName);
  Uri getForecastUrl(String cityName);
}

class ApiWeatherUrlProvider implements WeatherUrlProvider {
  const ApiWeatherUrlProvider({required this.apiKey});

  final String apiKey;

  @override
  Uri getCurrentWeatherUrl(String cityName) {
    return _buildUri(
      path: '/weather',
      queryParameters: _cityNameQueryParameters(cityName),
    );
  }

  @override
  Uri getForecastUrl(String cityName) {
    return _buildUri(
      path: '/forecast',
      queryParameters: _cityNameQueryParameters(cityName),
    );
  }

  static Uri _buildUri({
    String? path,
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: '/data/2.5/$path',
      queryParameters: queryParameters,
    );
  }

  Map<String, dynamic> _cityNameQueryParameters(String cityName) {
    return {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    };
  }
}
