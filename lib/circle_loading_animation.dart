
import 'package:animation_test_prj/circle_loading_animation_2.dart';
import 'package:animation_test_prj/widget/first_circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleLoadingAnimation extends StatefulWidget {
  const CircleLoadingAnimation({super.key});

  @override
  State<CircleLoadingAnimation> createState() => _CircleLoadingAnimationState();
}

class _CircleLoadingAnimationState extends State<CircleLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
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
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Center(
          child: Stack(
            children: [
              CustomPaint(
                size: Size(100, 100),
                painter: FirstCirclePainter(
                  startAngle: 0,
                  animationValue: _animationController.value,
                  radius: 30,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(10, 40),
                child: Text(
                  "Loading...",
                  style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
