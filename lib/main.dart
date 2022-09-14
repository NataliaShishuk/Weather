import 'package:flutter/material.dart';
import 'package:weather/presentation/pages/weather_page/weather_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'injection.dart' as di;

Future main() async {
  await dotenv.load();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherPage(),
    );
  }
}
