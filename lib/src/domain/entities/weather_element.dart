class WeatherElement {
  const WeatherElement({
    required this.main,
    required this.description,
    required this.iconCode,
  });

  final String main;
  final String description;
  final String iconCode;
}
