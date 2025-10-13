import 'package:animation_test_prj/widget/extension.dart';
import 'package:flutter/material.dart';

class FirstCirclePainter extends CustomPainter {
  final double radius;
  final double startAngle;
  final double animationValue;
  final Color color;
  

  FirstCirclePainter({
    super.repaint,
    required this.radius,
    required this.startAngle,
    required this.animationValue,
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    //Paint 1
    final Paint paint1 = Paint();
    paint1.strokeWidth = 3;
    paint1.color = Colors.lightBlueAccent;
    paint1.style = PaintingStyle.stroke;
     Offset arcCenter1 = Offset(size.width/2, size.height/2);
    canvas.drawArc(Rect.fromCircle(center: arcCenter1, radius: 50), (360*animationValue+270).toRadians, 90.toRadians, false, paint1);
    //Paint 2
     final Paint paint2 = Paint();
     paint2.strokeWidth = 3;
     paint2.color = Colors.pinkAccent;
     paint2.style = PaintingStyle.stroke;
     Offset arcCenter2 = Offset(size.width/2, size.height/2);
   canvas.drawArc(Rect.fromCircle(center: arcCenter2, radius: 50), ((360*animationValue+90)).toRadians, 90.toRadians, false, paint2);
      //Paint 3
    final Paint paint3 = Paint();
    paint3.strokeWidth = 3;
    paint3.color = Colors.purpleAccent;
    paint3.style = PaintingStyle.stroke;
     Offset arcCenter3 = Offset(size.width/2, size.height/2);
    canvas.drawArc(Rect.fromCircle(center: arcCenter3, radius: 60), (((360*animationValue))).toRadians, 90.toRadians, false, paint3);
    //Paint 4
     final Paint paint4 = Paint();
     paint4.strokeWidth = 3;
     paint4.color = Colors.greenAccent;
     paint4.style = PaintingStyle.stroke;
     Offset arcCenter4 = Offset(size.width/2, size.height/2);
     canvas.drawArc(Rect.fromCircle(center: arcCenter4, radius: 60), ((360*animationValue+180)).toRadians, 120.toRadians, false, paint4);

     //Paint 5
     final Paint paint5 = Paint();
     paint5.strokeWidth = 3;
     paint5.color = Colors.black;
     paint5.style = PaintingStyle.stroke;
     Offset arcCenter5 = Offset(size.width/2, size.height/2);
     canvas.drawArc(Rect.fromCircle(center: arcCenter5, radius: 70), (360-(360*animationValue)).toRadians, 150.toRadians, false, paint5);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
