import 'package:flutter/material.dart';
import 'package:weather/presentation/pages/weather_page/custom_card.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
    this.tooltipMessage,
  });

  final Widget icon;
  final String title;
  final String text;
  final String? tooltipMessage;

  @override
  Widget build(BuildContext context) {
    final card = _buildCard(context);

    if (tooltipMessage?.isNotEmpty ?? false) {
      return Tooltip(
        verticalOffset: 60,
        message: tooltipMessage,
        child: card,
      );
    } else {
      return card;
    }
  }

  Widget _buildCard(BuildContext context) {
    return CustomCard(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
