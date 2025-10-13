import 'package:animation_test_prj/widget/extension.dart';
import 'package:flutter/material.dart';

class ThirdCircleAnimation extends CustomPainter {
  final double animationValue;

  ThirdCircleAnimation({super.repaint, required this.animationValue});
  @override
  void paint(Canvas canvas, Size size) {
    Paint  paint1= Paint();
    paint1.color = Colors.grey;
    paint1.strokeWidth = 30;
    paint1.style= PaintingStyle.stroke;
    Offset center1 = Offset(size.width/2, size.height/2);
     
    Rect rect = Rect.fromCircle(center: center1, radius: 50);
    double startAngle = 0.toRadians;
    double sweepAngle = 360.toRadians;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint1);

    Paint paint2=Paint();
    paint2.color =  animationValue==1?Colors.grey: Colors.pinkAccent;
    paint2.strokeWidth = 30;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeCap =StrokeCap.round;
    double startAngle2= 90.toRadians;
    double sweepAngle2= (180*animationValue).toRadians;
    canvas.drawArc(rect, startAngle2, sweepAngle2, false, paint2);
   
    canvas.drawArc(rect, startAngle2, -sweepAngle2, false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }
  
}