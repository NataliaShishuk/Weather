import 'package:flutter/material.dart';

class WeatherLocation extends StatelessWidget {
  const WeatherLocation({
    super.key,
    required this.cityName,
    required this.onPressed,
  });

  final String cityName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        Icons.location_on_outlined,
        color: Theme.of(context).colorScheme.primary,
      ),
      label: Text(
        cityName,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
