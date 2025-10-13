import 'package:animation_test_prj/widget/extension.dart';
import 'package:flutter/material.dart';

class SecondCirclePainter extends CustomPainter {
  final double animationValue;
  final double smallRadius;
  final double largeRadius;
  SecondCirclePainter({super.repaint, required this.animationValue,required this.smallRadius,required this.largeRadius});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    paint1.color = Colors.blue;
    paint1.strokeWidth = 14;
    paint1.style = PaintingStyle.stroke;
    Offset center = Offset(size.width/2, size.height/2);
    // Rect rect = Rect.fromCircle(center: center, radius: 55+(animationValue > 0.95 ? 15 : 0));
     Rect rect = Rect.fromCircle(center: center, radius:largeRadius);
    double startAngle = 0.toRadians;
    double sweepAngle = 360.toRadians;
    //canvas.drawArc(rect, startAngle, sweepAngle, false, paint1);

    ///small painter
    Paint paint2 = Paint();
    paint2.color = Colors.blue;
    paint2.strokeWidth =5+(5*animationValue);
    paint2.style = PaintingStyle.stroke;
    Offset center2 = Offset(size.width/2, size.height/2);
    // Rect rect2 = Rect.fromCircle(center: center2, radius: 55*animationValue+(animationValue == 1 ? 2 : 0));
    Rect rect2 = Rect.fromCircle(center: center2, radius: smallRadius);
    canvas.drawArc(rect2, startAngle, sweepAngle, false, paint2);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class SecondCirclePainter2 extends CustomPainter {
  final double animationValue;
  final double smallRadius;
  final double largeRadius;
  SecondCirclePainter2({super.repaint, required this.animationValue,required this.smallRadius,required this.largeRadius});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    paint1.color = Colors.blue;
    paint1.strokeWidth = 14;
    paint1.style = PaintingStyle.stroke;
    Offset center = Offset(size.width/2, size.height/2);
    // Rect rect = Rect.fromCircle(center: center, radius: 55+(animationValue > 0.95 ? 15 : 0));
     Rect rect = Rect.fromCircle(center: center, radius:largeRadius);
    double startAngle = 0.toRadians;
    double sweepAngle = 360.toRadians;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint1);

    ///small painter
    Paint paint2 = Paint();
    paint2.color = Colors.blue;
    paint2.strokeWidth =5+(5*animationValue);
    paint2.style = PaintingStyle.stroke;
    Offset center2 = Offset(size.width/2, size.height/2);
    // Rect rect2 = Rect.fromCircle(center: center2, radius: 55*animationValue+(animationValue == 1 ? 2 : 0));
    Rect rect2 = Rect.fromCircle(center: center2, radius: smallRadius);
   // canvas.drawArc(rect2, startAngle, sweepAngle, false, paint2);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}