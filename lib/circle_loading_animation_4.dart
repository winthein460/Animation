import 'package:animation_test_prj/all_animation.dart';
import 'package:animation_test_prj/three_rotating_dots.dart';
import 'package:animation_test_prj/widget/fourth_circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleLoadingAnimation4 extends StatefulWidget {
  const CircleLoadingAnimation4({super.key});

  @override
  State<CircleLoadingAnimation4> createState() => _CircleLoadingAnimation4State();
}

class _CircleLoadingAnimation4State extends State<CircleLoadingAnimation4> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation; 

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 3500));
    _animation = Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut));
     _animationController.repeat(reverse: false);
 
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(animation: _animation, builder:(context, child) => 
    CustomPaint(
      size: Size(200,200),
      painter: FourthCirclePainter(animationValue: _animationController.value),
    )
    ,);
  }
}