class ApiWeatherUrlProvider {
  final String _apiKey;

  const ApiWeatherUrlProvider(this._apiKey);

  Uri getCurrentWeatherUrl(String cityName) {
    return _buildUri(
      path: '/weather',
      queryParameters: _cityNameQueryParameters(cityName),
    );
  }

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
      'appid': _apiKey,
      'units': 'metric',
    };
  }
}
