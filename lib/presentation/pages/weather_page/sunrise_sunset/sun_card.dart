import 'package:flutter/material.dart';
import 'package:weather/presentation/weather_helper.dart';

class SunCard extends StatelessWidget {
  const SunCard({
    super.key,
    required this.title,
    required this.date,
    required this.image,
  });

  final String title;
  final DateTime date;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 10),
        Text(
          WeatherHelper.getHoursMinuteDateFormat(date),
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        image
      ],
    );
  }
}
