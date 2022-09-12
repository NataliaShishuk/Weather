import 'package:flutter/material.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/usecases/get_locations.dart';
import 'package:weather/presentation/app_colors.dart';
import 'package:weather/presentation/pages/locations_page/location_list.dart';
import 'package:weather/injection.dart' as di;
import 'package:async_builder/async_builder.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({
    super.key,
  });

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final GetLocations _getLocations = di.locator<GetLocations>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primmaryBackgroundColor,
        title: const Text(
          'Select location',
          style: TextStyle(
            color: AppColors.primaryTextColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => _backButtonPressed(context),
        ),
      ),
      backgroundColor: AppColors.primmaryBackgroundColor,
      body: AsyncBuilder<List<Location>>(
        future: _getAllLocations(),
        waiting: (context) => const CircularProgressIndicator(),
        builder: (context, data) => LocationList(locations: data!)
      ),
    );
  }

  Future<List<Location>> _getAllLocations() => _getLocations.execute();

  void _backButtonPressed(BuildContext context) => Navigator.pop(context);
}
