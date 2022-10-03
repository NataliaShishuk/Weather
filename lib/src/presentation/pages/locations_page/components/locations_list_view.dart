import 'package:flutter/material.dart';
import 'package:weather/src/domain/entities/location.dart';
import 'package:weather/src/presentation/pages/locations_page/components/location_card.dart';

class LocationsListView extends StatelessWidget {
  const LocationsListView({
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
