import 'package:animation_test_prj/color_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotateAnimationPage extends StatefulWidget {
  const RotateAnimationPage({super.key});

  @override
  State<RotateAnimationPage> createState() => _RotateAnimationPageState();
}

class _RotateAnimationPageState extends State<RotateAnimationPage> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 3000))
    ..repeat();
    super.initState();
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  void _nextPage() {
    Get.to(()=>ColorAnimationPage());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ratate Animation"),
      
      ),
      body: Center(
        child: RotationTransition(
          turns: _animationController,child: Icon(Icons.star,size: 200,color: Colors.red,)),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}