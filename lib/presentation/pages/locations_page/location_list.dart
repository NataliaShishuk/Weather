import 'package:flutter/material.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/presentation/pages/locations_page/location_card.dart';

class LocationList extends StatelessWidget {
  const LocationList({
    super.key,
    required this.locations,
  });

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: locations.length,
      itemBuilder: (context, index) => LocationCard(
        location: locations[index],
      ),
    );
  }
}
