import 'package:weather/data/models/location_model.dart';

abstract class LocationDataSource {
  Future<List<LocationModel>> getLocations();
}
