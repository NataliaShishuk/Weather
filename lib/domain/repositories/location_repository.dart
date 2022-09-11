import 'package:weather/domain/entities/location.dart';

abstract class LocationRepository {
  Future<List<Location>> getLocations();
}
