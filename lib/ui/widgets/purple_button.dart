
import 'package:flutter/material.dart';
import 'package:todays_activities/ui/themes/colors.dart';

class PurpleButton extends StatelessWidget {
  const PurpleButton({
    super.key,
    required this.onTap,
    required this.child,
    this.horizontalMargin,
    this.color
    });

  final Function()? onTap;
  final Widget child;
  final double? horizontalMargin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: horizontalMargin ?? 0.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color ??ColorPalette.firstPurple,
        ),
        child: child,
      ),
    );
  }
}
