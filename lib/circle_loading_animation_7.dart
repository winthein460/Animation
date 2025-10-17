import 'dart:math';

import 'package:flutter/material.dart';

class CircleLoadingAnimation7 extends StatefulWidget {
  const CircleLoadingAnimation7({super.key});

  @override
  State<CircleLoadingAnimation7> createState() =>
      _CircleLoadingAnimation7State();
}

class _CircleLoadingAnimation7State extends State<CircleLoadingAnimation7>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    _animationController.addStatusListener((status) {
     if (status.isCompleted) {
       print("Completed");
     }else if(status.isDismissed){
       print("Dimissed");
     }
    });
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
      animation: _animation,
      builder:
          (context, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(_animation.value * 30, 0),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(_animation.value * -30, 0),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
