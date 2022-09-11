import 'package:weather/data/datasources/location_data_source.dart';
import 'package:weather/data/models/location_model.dart';

class StaticLocationDataSourse implements LocationDataSource {
  @override
  Future<List<LocationModel>> getLocations() async {
    final cityNames = ['Brest', 'Minsk', 'New York'];

    return cityNames
        .map((cityName) => LocationModel(cityName: cityName))
        .toList();
  }
}
