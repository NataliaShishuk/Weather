import 'package:flutter/material.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/presentation/app_colors.dart';

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
          style: const TextStyle(
            color: AppColors.mainTextColor,
          ),
        ),
      ),
    );
  }

  void locationPressed(BuildContext context) {
    Navigator.pop(context, location);
  }
}
