import 'package:animation_test_prj/widget/third_circle_painter.dart';
import 'package:flutter/material.dart';

class CircleLoadingAnimation3 extends StatefulWidget {
  const CircleLoadingAnimation3({super.key});

  @override
  State<CircleLoadingAnimation3> createState() =>
      _CircleLoadingAnimation3State();
}

class _CircleLoadingAnimation3State extends State<CircleLoadingAnimation3>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _animationController2.forward(from: 0);
      }
    });

    _animationController2.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _animationController.forward(from: 0);
      }
    });

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder:
          (context, child) => Stack(
            children: [
              AnimatedBuilder(
                animation: _animationController2,
                builder:
                    (context, child) => CustomPaint(
                      size: Size(200, 200),
                      painter: ThirdCircleAnimation(
                        animationValue: _animationController2.value,
                      ),
                    ),
              ),
              AnimatedBuilder(
                animation: _animationController,
                builder:
                    (context, child) => Transform.translate(
                      offset: Offset(
                        82,
                        _animation.value == 0 ? 10 : (133 * _animation.value),
                      ),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
              ),
            ],
          ),
    );
  }
}
