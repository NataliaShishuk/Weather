import 'package:flutter/material.dart';
import 'package:weather/domain/failure.dart';

class FailureInfo extends StatelessWidget {
  const FailureInfo({
    super.key,
    required this.failure,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildFailureInfo(context),
    );
  }

  Widget buildFailureInfo(BuildContext context) {
    if (failure is ConnectionFailure) {
      return Column(
        children: [
          Icon(
            Icons.wifi_off,
            color: Theme.of(context).colorScheme.primary,
            size: 150,
          ),
          const SizedBox(height: 15),
          Text(
            'Oops, no internet connection...',
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),
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
            size: 150,
          ),
          const SizedBox(height: 15),
          Text(
            failure.message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      );
    }
  }
}
