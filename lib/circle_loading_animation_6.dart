import 'dart:math';

import 'package:animation_test_prj/widget/extension.dart';
import 'package:flutter/material.dart';

class CircleLoadingAnimation6 extends StatefulWidget {
  const CircleLoadingAnimation6({super.key});

  @override
  State<CircleLoadingAnimation6> createState() =>
      _CircleLoadingAnimation6State();
}

class _CircleLoadingAnimation6State extends State<CircleLoadingAnimation6>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: pi,
        ).chain(CurveTween(curve: Interval(0.0, 0.4, curve: Curves.bounceInOut))),
        weight: 2,
      ),
      TweenSequenceItem(
    tween: ConstantTween(pi)
        .chain(CurveTween(curve: Interval(0.4, 0.55, curve: Curves.bounceInOut))),
    weight: 1,
  ),
      TweenSequenceItem(
        tween: Tween(
          begin: pi,
          end: pi*2,
        ).chain(CurveTween(curve: Interval(0.55, 0.95, curve: Curves.bounceInOut))),
        weight: 2,
      ),
      TweenSequenceItem(
    tween: ConstantTween(pi*2)
        .chain(CurveTween(curve: Interval(0.95, 1.0, curve: Curves.bounceInOut))),
    weight: 1,
  ),
    ]).animate(_animationController);
    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
       await Future.delayed(const Duration(milliseconds: 200));
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
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder:
            (context, child) => Transform.rotate(
              angle:  _animation.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:Colors.pink,
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
