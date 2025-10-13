
import 'package:animation_test_prj/widget/extension.dart';
import 'package:flutter/material.dart';

class FifthCirclePainter extends CustomPainter {
  final double animationValue;

  FifthCirclePainter({required this.animationValue});


  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    const double radius = 50;

    Paint paint1 =
        Paint()
          ..color = Colors.grey
          ..strokeWidth = 30
          ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, 0.toRadians, 360.toRadians, false, paint1);

    Paint paint2 =
        Paint()
          ..color = animationValue == 1 ? Colors.grey : Colors.green
          ..strokeWidth = 30
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

     double startAngle2 = 90.toRadians;
    final double sweepAngle2 = (360 * animationValue).toRadians;

    canvas.drawArc(rect, startAngle2, sweepAngle2, false, paint2);
  }

  @override
  bool shouldRepaint(covariant FifthCirclePainter oldDelegate) {
    return true;
  }
}