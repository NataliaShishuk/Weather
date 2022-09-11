import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/repositories/location_repository.dart';

class GetLocations {
  GetLocations({
    required this.locationRepository,
  });

  final LocationRepository locationRepository;

  Future<List<Location>> execute() {
    return locationRepository.getLocations();
  }
}
