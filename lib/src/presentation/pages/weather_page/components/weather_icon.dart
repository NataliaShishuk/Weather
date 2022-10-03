import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon extends StatelessWidget {
  static final Map<String, IconData> _iconsMap = {
    // clear sky
    '01d': WeatherIcons.day_sunny,
    '01n': WeatherIcons.night_clear,

    // few clouds
    '02d': WeatherIcons.day_cloudy,
    '02n': WeatherIcons.night_alt_partly_cloudy,

    // scattered clouds
    '03d': WeatherIcons.day_cloudy_high,
    '03n': WeatherIcons.night_cloudy_high,

    // broken clouds
    '04d': WeatherIcons.day_cloudy_high,
    '04n': WeatherIcons.night_cloudy_high,

    // shower rain
    '09d': WeatherIcons.day_showers,
    '09n': WeatherIcons.night_showers,

    // rain
    '10d': WeatherIcons.day_rain,
    '10n': WeatherIcons.night_alt_rain,

    // thunderstorm
    '11d': WeatherIcons.day_thunderstorm,
    '11n': WeatherIcons.night_thunderstorm,

    // snow
    '13d': WeatherIcons.day_snow,
    '13n': WeatherIcons.night_alt_snow,

    // mist
    '50d': WeatherIcons.day_fog,
    '50n': WeatherIcons.night_fog,
  };

  const WeatherIcon({
    super.key,
    required this.iconCode,
    required this.size,
  });

  final String iconCode;
  final double size;

  @override
  Widget build(BuildContext context) {
    _getIconDataByCode(iconCode);

    return BoxedIcon(
      _getIconDataByCode(iconCode),
      size: size,
    );
  }

  IconData _getIconDataByCode(String iconCode) {
    return _iconsMap[iconCode] ?? WeatherIcons.na;
  }
}
