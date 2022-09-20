import 'package:flutter/material.dart';
import 'package:weather/domain/entities/sys.dart';
import 'package:weather/presentation/pages/weather_page/sunrise_sunset/sun_card.dart';

class SunriseSunset extends StatelessWidget {
  const SunriseSunset({
    super.key,
    required this.sys,
  });

  final Sys sys;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SunCard(
              title: 'Sunrise',
              date: sys.sunrise,
              image: Image.asset(
                'assets/images/sunrise.png',
              )),
          SunCard(
              title: 'Sunset',
              date: sys.sunset,
              image: Image.asset(
                'assets/images/sunset.png',
              ))
        ],
      ),
    );
  }
}
