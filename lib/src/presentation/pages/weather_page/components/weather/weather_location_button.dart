import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WeatherLocationButton extends StatelessWidget {
  const WeatherLocationButton({
    super.key,
    required this.countryCode,
    required this.cityName,
    required this.onPressed,
  });

  final String countryCode;
  final String cityName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        icon: CachedNetworkImage(
          width: 30,
          imageUrl: _getFlagApiUrl(countryCode),
          errorWidget: (context, url, error) => Icon(
            Icons.location_on_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        label: Text(
          cityName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 18,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  String _getFlagApiUrl(String countryCode) {
    return 'https://countryflagsapi.com/png/$countryCode';
  }
}
