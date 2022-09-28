import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:weather/domain/entities/forecast.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/domain/result.dart';
import 'package:weather/domain/usecases/get_weather.dart';
import 'package:weather/presentation/pages/locations_page/locations_page.dart';
import 'package:weather/presentation/pages/weather_page/failure_info.dart';
import 'package:weather/presentation/pages/weather_page/sunrise_sunset/sunrise_sunset.dart';
import 'package:weather/presentation/pages/weather_page/section_title.dart';
import 'package:weather/presentation/pages/weather_page/forecast/daily_forecast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/injection.dart' as di;
import 'package:weather/presentation/pages/weather_page/weather/weather_location.dart';
import 'package:weather/presentation/pages/weather_page/weather/weather_swiper.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({
    super.key,
  });

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final GetWeather _getWeather = di.locator<GetWeather>();

  // default city
  String currentCityName = 'Brest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _pageRefresh,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).backgroundColor,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    constraints: const BoxConstraints(maxWidth: 625),
                    child: AsyncBuilder<Result<List, Failure>>(
                      future: _getData(currentCityName),
                      waiting: (context) => _wetherLoading(),
                      builder: (context, data) => _buildWeather(data!),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Result<List, Failure>> _getData(String cityName) {
    return _getWeather.execute(cityName);
  }

  Widget _buildWeather(Result<List, Failure> weatherResult) {
    if (weatherResult.isSuccess) {
      final data = weatherResult.result!;
      final weather = data[0] as Weather;
      final forecast = data[1] as Forecast;

      return _weatherHasData(weather, forecast);
    } else {
      final failure = weatherResult.failure!;

      return _weatherError(failure);
    }
  }

  Widget _wetherLoading() {
    return SpinKitFadingCircle(color: Theme.of(context).colorScheme.primary);
  }

  Widget _weatherHasData(Weather weather, Forecast forecast) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeatherSwiper(
          weather: weather,
          forecast: forecast,
        ),
        WeatherLocation(
          countryCode: weather.sys.countryCode,
          cityName: currentCityName,
          onPressed: () => _locationButtonPressed(context),
        ),
        const SectionTitle(name: 'Forecast'),
        DailyForecast(forecast: forecast),
        const SectionTitle(name: 'Sunrise and sunset'),
        SunriseSunset(
          sunriseDate: weather.sys.sunrise,
          sunsetDate: weather.sys.sunset,
        ),
      ],
    );
  }

  Widget _weatherError(Failure failure) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FailureInfo(failure: failure),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: _pageRefresh,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            child: Text(
              'Refresh',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _locationButtonPressed(BuildContext context) async {
    var location = await Navigator.push<Location>(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationsPage(),
      ),
    );

    if (!mounted || location == null) {
      return;
    }

    setState(() => currentCityName = location.cityName);
  }

  Future<void> _pageRefresh() async => setState(() {});
}
