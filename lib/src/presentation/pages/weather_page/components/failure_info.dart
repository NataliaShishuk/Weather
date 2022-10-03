import 'package:flutter/material.dart';
import 'package:weather/src/domain/failure.dart';

class FailureInfo extends StatelessWidget {
  const FailureInfo({
    super.key,
    required this.failure,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    if (failure is ConnectionFailure) {
      return Column(
        children: [
          Icon(
            Icons.wifi_off,
            color: Theme.of(context).colorScheme.primary,
            size: 120,
          ),
          const SizedBox(height: 15),
          Text(
            'Oops, no internet connection...',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          )
        ],
      );
    } else {
      return Column(
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.primary,
            size: 120,
          ),
          const SizedBox(height: 15),
          Text(
            failure.message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          )
        ],
      );
    }
  }
}
