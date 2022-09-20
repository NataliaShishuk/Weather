import 'package:flutter/material.dart';
import 'package:weather/domain/entities/location.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
        onPressed: () => locationPressed(context),
        child: Text(
          location.cityName,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15),
        ),
      ),
    );
  }

  void locationPressed(BuildContext context) {
    Navigator.pop(context, location);
  }
}
