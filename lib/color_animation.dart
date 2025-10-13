import 'package:animation_test_prj/rotate_animation.dart';
import 'package:animation_test_prj/tween_sequence_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorAnimationPage extends StatefulWidget {
  const ColorAnimationPage({super.key});

  @override
  State<ColorAnimationPage> createState() => _ColorAnimationPageState();
}

class _ColorAnimationPageState extends State<ColorAnimationPage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 5000))
    ..repeat(reverse: true);
    _colorAnimation = ColorTween(begin: Colors.red,end: Colors.blue).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Color Animation"),),
      body: Center(
        child: AnimatedBuilder(animation: _colorAnimation, builder:(context, child) {
          return Container(
            width: 150,
            height: 150,
           decoration: BoxDecoration(
             color: _colorAnimation.value,
             borderRadius: BorderRadius.circular(20)
           ),
            child: Center(child: Text("Color",style: TextStyle(color: Colors.white),)),
          );
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=>
           TweenSequenceAnimation()
          );
        },
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward_ios),
      ), 
    );
  }
}