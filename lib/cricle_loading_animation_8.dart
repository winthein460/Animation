import 'dart:math';

import 'package:flutter/material.dart';

class CircleLoadingAnimation8 extends StatefulWidget {
  const CircleLoadingAnimation8({super.key});

  @override
  State<CircleLoadingAnimation8> createState() => _CircleLoadingAnimation8State();
}

class _CircleLoadingAnimation8State extends State<CircleLoadingAnimation8>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 1000),
          )
          ..addListener(_listenAnimation)
          ..addStatusListener(_listenAnimationStatus);
    Future.delayed(const Duration(seconds: 3)).then((_) {
      _controller.forward();
    });
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
  }

  void _listenAnimation() {
    if (_controller.value == 0.5) {
      _controller.stop();
      Future.delayed(const Duration(milliseconds: 500)).then((_) {
        _controller.forward(from: 0.51);
      });
    }
  }

  void _listenAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reset();
      Future.delayed(const Duration(milliseconds: 500)).then((_) {
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (c, child) {
            // if (_controller.value > 0.5) {
            //   _controller.stop();
            // }
            return Transform.rotate(
              angle: (90 * 4 * (pi / 180.0) * animation.value),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  circleWidget(Colors.red),
                  SizedBox(width: 10),
                  circleWidget(Colors.green),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget circleWidget(Color color) => Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}