import 'package:animation_test_prj/rotate_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BounceScaleAnimationPage extends StatefulWidget {
  const BounceScaleAnimationPage({super.key});

  @override
  State<BounceScaleAnimationPage> createState() => _BounceScaleAnimationPageState();
}

class _BounceScaleAnimationPageState extends State<BounceScaleAnimationPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
    _scaleAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceIn));
    _animationController.forward();
    _animationController.addStatusListener((status){
     if (status.isCompleted) {
       _animationController.reverse();
     }else if(status.isDismissed){
       _animationController.forward();
     }
    });
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  void _nextPage() {
    Get.to(()=>RotateAnimationPage());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bounce Scal Animation",),),
      body: Center(
        child: ScaleTransition(scale: _scaleAnimation,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(color: Colors.green,shape: BoxShape.circle),
          child: Text("Scale",style: TextStyle(color: Colors.white),),
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}