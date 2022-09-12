import 'package:flutter/material.dart';
import 'package:weather/domain/failure.dart';
import 'package:weather/presentation/app_colors.dart';

class FailureInfo extends StatelessWidget {
  const FailureInfo({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildFailureInfo(),
    );
  }

  Widget buildFailureInfo() {
    if (failure is ConnectionFailure) {
      return Column(
        children: const [
          Icon(
            Icons.wifi_off,
            color: AppColors.primaryTextColor,
            size: 150,
          ),
          SizedBox(height: 15),
          Text(
            'Oops, no internet connection...',
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      );
    } else {
      return Column(
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.primaryTextColor,
            size: 150,
          ),
          const SizedBox(height: 15),
          Text(
            failure.message,
            style: const TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      );
    }
  }
}
