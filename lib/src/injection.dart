import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:weather/src/data/datasources/api_weather_data_source.dart';
import 'package:weather/src/data/datasources/location_data_source.dart';
import 'package:weather/src/data/datasources/static_location_data_source.dart';
import 'package:weather/src/data/datasources/weather_data_source.dart';
import 'package:weather/src/data/repositories/weather_repository_impl.dart';
import 'package:weather/src/data/repositories/location_repository_impl.dart';
import 'package:weather/src/data/providers/api_weather_url_provider.dart';
import 'package:weather/src/domain/repositories/location_repository.dart';
import 'package:weather/src/domain/repositories/weather_repository.dart';
import 'package:weather/src/domain/usecases/get_locations_use_case.dart';
import 'package:weather/src/domain/usecases/get_weather_use_case.dart';

final locator = GetIt.instance;

void init() {
  // usecase
  locator.registerLazySingleton(
    () => GetWeatherUseCase(
      weatherRepository: locator(),
    ),
  );

  locator.registerLazySingleton(
    () => GetLocationsUseCase(
      locationRepository: locator(),
    ),
  );

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      weatherDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      locationDataSourse: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<WeatherDataSource>(
    () => ApiWeatherDataSource(
      client: locator(),
      apiWeatherUrlProvider: locator(),
    ),
  );

  locator.registerLazySingleton<LocationDataSource>(
    () => StaticLocationDataSourse(),
  );

  locator.registerLazySingleton<ApiWeatherUrlProvider>(
    () => ApiWeatherUrlProvider(dotenv.env['API_KEY'] ?? 'DEFAULT_API_KEY'),
  );

  // external
  locator.registerLazySingleton(
    () => http.Client(),
  );
}
