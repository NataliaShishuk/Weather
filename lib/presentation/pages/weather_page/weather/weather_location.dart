import 'package:flutter/material.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/app_colors.dart';

class WeatherLocation extends StatelessWidget {
  const WeatherLocation({
    super.key,
    required this.cityName,
    required this.onPressed,
    this.size = 20,
  });

  final String cityName;
  final Function() onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        Icons.location_on_outlined,
        color: AppColors.secondaryTextColor,
        size: size,
      ),
      label: Text(
        cityName,
        style: TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: size,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
