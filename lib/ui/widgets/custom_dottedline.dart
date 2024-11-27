import 'package:flutter/material.dart';
import 'package:todays_activities/ui/themes/colors.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorPalette.greyLines
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double dashHeight = 4;
    const double dashSpacing = 4;
    
    double startY = 10;
    double leftMargin = 20;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(leftMargin, startY),
        Offset(leftMargin, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpacing;
    }

    const double circleRadius = 5;
    final circlePaint = Paint()..color = ColorPalette.firstYellow;

    canvas.drawCircle(Offset(leftMargin, 10), circleRadius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}