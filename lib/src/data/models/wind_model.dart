import 'package:weather/src/domain/entities/wind.dart';

class WindModel {
  const WindModel({
    required this.speed,
    required this.deg,
  });

  final double speed;
  final double deg;

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
        speed: json['speed'].toDouble(),
        deg: json['deg'].toDouble(),
      );

  Wind toEntity() => Wind(
        speed: speed,
        deg: deg,
      );
}
