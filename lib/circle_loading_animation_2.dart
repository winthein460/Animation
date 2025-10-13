import 'dart:math';

import 'package:animation_test_prj/circle_loading_animation_3.dart';
import 'package:animation_test_prj/widget/second_circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleLoadingAnimation2 extends StatefulWidget {
  const CircleLoadingAnimation2({super.key});

  @override
  State<CircleLoadingAnimation2> createState() =>
      _CircleLoadingAnimation2State();
}

class _CircleLoadingAnimation2State extends State<CircleLoadingAnimation2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ValueNotifier<double> animationScale;

  @override
  void initState() {
    animationScale = ValueNotifier(1.0);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
   
    _animationController.addStatusListener((status) async {
  if (status == AnimationStatus.completed) {
    debugPrint("Work");
    animationScale.value = 0.8;
    await Future.delayed(const Duration(milliseconds: 100));
    animationScale.value = 1.0;

   _animationController.reset(); 
    _animationController.forward(from: 0);
  }
});
 _animationController.forward();
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
      builder:
          (context, child) => Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: animationScale,
                builder: (context, scale, child) =>  AnimatedScale(
                  scale: scale,
                  duration: Duration(milliseconds: 0),
                  child: CustomPaint(
                    size: Size(150, 150),
                    painter: SecondCirclePainter2(
                      largeRadius: 50,
                      smallRadius: 0,
                      animationValue: _animationController.value,
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animationController,
                child: CustomPaint(
                  size: Size(150, 150),
                  painter: SecondCirclePainter(
                    largeRadius: 0,
                    smallRadius: 55*_animationController.value+(_animationController.value* 2),
                    animationValue: _animationController.value,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
