import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:weather/data/datasources/api_weather_data_source.dart';
import 'package:weather/data/datasources/location_data_source.dart';
import 'package:weather/data/datasources/static_location_data_source.dart';
import 'package:weather/data/datasources/weather_data_source.dart';
import 'package:weather/data/repositories/api_weather_repository.dart';
import 'package:weather/data/repositories/static_location_repository.dart';
import 'package:weather/data/weather_url_provider.dart';
import 'package:weather/domain/repositories/location_repository.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/domain/usecases/get_locations.dart';
import 'package:weather/domain/usecases/get_weather.dart';

final locator = GetIt.instance;

void init() {
  // usecase
  locator.registerLazySingleton(
    () => GetWeather(
      weatherRepository: locator(),
    ),
  );

  locator.registerLazySingleton(
    () => GetLocations(
      locationRepository: locator(),
    ),
  );

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => ApiWeatherRepository(
      weatherDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<LocationRepository>(
    () => StaticLocationRepository(
      locationDataSourse: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<WeatherDataSource>(
    () => ApiWeatherDataSource(
      client: locator(),
      weatherUrlProvider: locator(),
    ),
  );

  locator.registerLazySingleton<LocationDataSource>(
    () => StaticLocationDataSourse(),
  );

  locator.registerLazySingleton<WeatherUrlProvider>(
    () => ApiWeatherUrlProvider(
      apiKey: dotenv.env['API_KEY'] ?? 'DEFAULT_API_KEY',
    ),
  );

  // external
  locator.registerLazySingleton(
    () => http.Client(),
  );
}
