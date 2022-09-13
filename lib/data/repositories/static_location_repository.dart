import 'package:weather/data/datasources/location_data_source.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/repositories/location_repository.dart';

class StaticLocationRepository implements LocationRepository {
  const StaticLocationRepository({
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
