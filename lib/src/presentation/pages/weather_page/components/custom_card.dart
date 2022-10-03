import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    this.child,
  });

  final double? width;
  final double? height;
  final Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(15));

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: borderRadius,
      ),
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
    );
  }
}
