import 'package:weather/src/domain/entities/location.dart';

class LocationModel {
  const LocationModel({required this.cityName});

  final String cityName;

  Location toEntity() => Location(
        cityName: cityName,
      );
}
