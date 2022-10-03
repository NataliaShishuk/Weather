import 'package:flutter/material.dart';
import 'package:weather/src/presentation/pages/weather_page/weather_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/src/presentation/theme.dart';

import 'src/injection.dart' as di;

Future main() async {
  await dotenv.load();
  di.init();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      home: const WeatherPage(),
    );
  }
}
