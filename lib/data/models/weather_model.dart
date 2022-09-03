class WeatherModel {
  const WeatherModel({
    required this.cityName,
    required this.main,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });

  final String cityName;
  final String main;
  final String description;
  final String icon;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double feelsLike;
  final double pressure;
  final double humidity;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      cityName: json['name'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temperature: json['main']['temp'],
      minTemperature: json['main']['temp_min'],
      maxTemperature: json['main']['temp_max'],
      feelsLike: json['main']['feels_like'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity']);
}
