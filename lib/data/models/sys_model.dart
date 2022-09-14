import 'package:weather/domain/entities/sys.dart';

class SysModel {
  const SysModel({
    required this.sunrise,
    required this.sunset,
  });

  final int sunrise;
  final int sunset;

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        sunrise: json['sunrise'] as int,
        sunset: json['sunset'] as int,
      );

  Sys toEntity() => Sys(
        sunrise: _convertEpochToDateTime(sunrise),
        sunset: _convertEpochToDateTime(sunset),
      );

  static DateTime _convertEpochToDateTime(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true)
          .toLocal();
}
