import 'package:flutter/material.dart';
import 'package:weather/src/domain/entities/location.dart';
import 'package:weather/src/domain/usecases/get_locations_use_case.dart';
import 'package:weather/src/presentation/pages/locations_page/components/locations_list_view.dart';
import 'package:weather/src/injection.dart' as di;
import 'package:async_builder/async_builder.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({
    super.key,
  });

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final GetLocationsUseCase _getLocationsUseCase =
      di.locator<GetLocationsUseCase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Select location',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => _backButtonPressed(context),
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SafeArea(
        child: AsyncBuilder<List<Location>>(
          future: _getAllLocations(),
          waiting: (context) => const CircularProgressIndicator(),
          builder: (context, data) => LocationsListView(locations: data!),
        ),
      ),
    );
  }

  Future<List<Location>> _getAllLocations() => _getLocationsUseCase.execute();

  void _backButtonPressed(BuildContext context) => Navigator.pop(context);
}
