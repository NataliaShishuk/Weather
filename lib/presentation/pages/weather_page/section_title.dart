import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
      child: Text(
        name,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 25,
        ),
      ),
    );
  }
}
