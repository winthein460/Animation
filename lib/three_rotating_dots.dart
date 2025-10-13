import 'package:flutter/material.dart';

class ThreeRotatingDots extends StatefulWidget {
  const ThreeRotatingDots({super.key});

  @override
  State<ThreeRotatingDots> createState() => _ThreeRotatingDotsState();
}

class _ThreeRotatingDotsState extends State<ThreeRotatingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    animation = Tween<Offset>(begin: Offset(0.5, 0.8), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.8, curve: Curves.bounceIn),
      ),
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
    return Scaffold(
      appBar: AppBar(title: Text("Three Rotating Dots")),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder:
              (context, child) => Stack(
                children: [
                  SlideTransition(
                    position: animation,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
