import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    this.width,
    this.onPressed,
    this.child,
  });

  final double? width;
  final Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(15));

    return SizedBox(
      width: width,
      child: Material(
        color: Theme.of(context).backgroundColor,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
