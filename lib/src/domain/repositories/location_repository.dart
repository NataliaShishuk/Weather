import 'package:weather/src/domain/entities/location.dart';

abstract class LocationRepository {
  Future<List<Location>> getLocations();
}
