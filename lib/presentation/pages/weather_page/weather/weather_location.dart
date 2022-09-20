import 'package:flutter/material.dart';

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
        color: Theme.of(context).colorScheme.primary,
        size: size,
      ),
      label: Text(
        cityName,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: size),
      ),
      onPressed: onPressed,
    );
  }
}
