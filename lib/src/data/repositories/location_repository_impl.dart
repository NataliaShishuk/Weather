import 'package:weather/src/data/datasources/location_data_source.dart';
import 'package:weather/src/domain/entities/location.dart';
import 'package:weather/src/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  const LocationRepositoryImpl({
    required this.locationDataSourse,
  });

  final LocationDataSource locationDataSourse;

  @override
  Future<List<Location>> getLocations() async {
    final locationModels = await locationDataSourse.getLocations();

    return locationModels
        .map((locationModel) => locationModel.toEntity())
        .toList();
  }
}
