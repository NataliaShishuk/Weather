import 'package:weather/src/domain/entities/location.dart';
import 'package:weather/src/domain/repositories/location_repository.dart';

class GetLocationsUseCase {
  GetLocationsUseCase({
    required this.locationRepository,
  });

  final LocationRepository locationRepository;

  Future<List<Location>> execute() {
    return locationRepository.getLocations();
  }
}
