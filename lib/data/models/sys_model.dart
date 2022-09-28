import 'package:weather/domain/entities/sys.dart';

class SysModel {
  const SysModel({
    required this.countryCode,
    required this.sunrise,
    required this.sunset,
  });

  final String countryCode;
  final int sunrise;
  final int sunset;

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        countryCode: json['country'],
        sunrise: json['sunrise'] as int,
        sunset: json['sunset'] as int,
      );

  Sys toEntity() => Sys(
        countryCode: countryCode,
        sunrise: _convertEpochToDateTime(sunrise),
        sunset: _convertEpochToDateTime(sunset),
      );

  static DateTime _convertEpochToDateTime(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true)
          .toLocal();
}
