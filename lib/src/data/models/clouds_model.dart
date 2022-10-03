import 'package:weather/src/domain/entities/clouds.dart';

class CloudsModel {
  const CloudsModel({
    required this.all,
  });

  final double all;

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
        all: json['all'].toDouble(),
      );

  Clouds toEntity() => Clouds(
        all: all,
      );
}
