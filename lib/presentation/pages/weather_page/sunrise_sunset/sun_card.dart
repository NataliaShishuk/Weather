import 'package:flutter/material.dart';
import 'package:weather/presentation/pages/formater.dart';
import 'package:weather_icons/weather_icons.dart';

class SunCard extends StatelessWidget {
  const SunCard({
    super.key,
    required this.title,
    required this.date,
    required this.iconData,
  });

  final String title;
  final DateTime date;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          Formater.formatDateToHoursMinute(date),
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        BoxedIcon(
          iconData,
          size: 50,
        ),
      ],
    );
  }
}
