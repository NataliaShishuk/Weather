class WeatherElement {
  const WeatherElement({
    required this.main,
    required this.description,
    required this.iconUrl,
  });

  final String main;
  final String description;
  final String iconUrl;
}
