import 'dart:math';

import 'package:animation_test_prj/widget/extension.dart';
import 'package:flutter/material.dart';

class FourthCirclePainter extends  CustomPainter{
  final double animationValue;
  FourthCirclePainter({super.repaint, required this.animationValue});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    paint1.color = Colors.lightBlueAccent;
    paint1.strokeWidth = 5;
    paint1.style = PaintingStyle.stroke;
    paint1.strokeCap = StrokeCap.round;

     Paint paint2 = Paint();
    paint2.color = Colors.red;
    paint2.strokeWidth = 5;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeCap = StrokeCap.round;
     Paint paint3 = Paint();
    paint3.color = Colors.green;
    paint3.strokeWidth = 5;
    paint3.style = PaintingStyle.stroke;
    paint3.strokeCap = StrokeCap.round;
    Offset center = Offset(size.width/2, size.height/2);
    Rect rect = Rect.fromCircle(center: center, radius: 50);
    double sweepAngle = (10 + 90 * (0.5 + 0.5 * sin(animationValue * 2 * pi))).toRadians;
    canvas.drawArc(rect, ((360*animationValue+120)).toRadians, sweepAngle, false, paint1);
    canvas.drawArc(rect, ((360*animationValue+240)).toRadians, sweepAngle, false, paint2);
    canvas.drawArc(rect, ((360*animationValue+360)).toRadians, sweepAngle, false, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}