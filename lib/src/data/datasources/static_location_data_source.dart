import 'package:weather/src/data/datasources/location_data_source.dart';
import 'package:weather/src/data/models/location_model.dart';

class StaticLocationDataSourse implements LocationDataSource {
  @override
  Future<List<LocationModel>> getLocations() async {
    final cityNames = [
      'New York',
      'Minsk',
      'Brest',
      'Grodno',
      'Vitebsk',
      'Mogilev',
      'Moscow',
    ];

    return cityNames
        .map((cityName) => LocationModel(cityName: cityName))
        .toList();
  }
}
