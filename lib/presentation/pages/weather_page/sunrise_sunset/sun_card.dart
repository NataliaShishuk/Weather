import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather/presentation/app_colors.dart';
import 'package:weather/presentation/pages/weather_page/weather/weather_header.dart';
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
          style: const TextStyle(
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          WeatherHelper.getHoursMinuteDateFormat(date),
          style: const TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        image
      ],
    );
  }
}
