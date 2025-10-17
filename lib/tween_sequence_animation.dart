import 'dart:math';

import 'package:animation_test_prj/all_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TweenSequenceAnimation extends StatefulWidget {
  const TweenSequenceAnimation({super.key});

  @override
  State<TweenSequenceAnimation> createState() => _TweenSequenceAnimationState();
}

class _TweenSequenceAnimationState extends State<TweenSequenceAnimation> with SingleTickerProviderStateMixin{
  late AnimationController? _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _moveAnimation;
  late Animation<double> _rotateAnimation;
  @override
  void initState() {
   _animationController = AnimationController(vsync: this,duration: Duration(seconds: 5));
   _fadeAnimation = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0,end: 0.1).chain(CurveTween(curve: Curves.easeIn)), weight: 1),
    TweenSequenceItem(tween: ConstantTween(1.0), weight: 4)
   ]).animate(_animationController!);
   _moveAnimation = TweenSequence([
    TweenSequenceItem(tween: ConstantTween(0.0), weight: 1),
    TweenSequenceItem(tween: Tween(begin:0.0,end: -100.0 ).chain(CurveTween(curve: Curves.bounceInOut)), weight: 2),
    TweenSequenceItem(tween: ConstantTween(-100.0), weight: 1),
   ]).animate(_animationController!);
  _rotateAnimation = TweenSequence([
  
  TweenSequenceItem(tween: ConstantTween(0.0), weight: 2),
  TweenSequenceItem(tween: Tween(begin: 0.0,end: pi/2).chain(CurveTween(curve: Curves.linear)), weight: 2),

  ]).animate(_animationController!);
    _animationController?.repeat(reverse: true);
    super.initState();
  }
  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Tween Sequence Animation"),
        ),
      body: Center(
        child: AnimatedBuilder(animation: _animationController!, builder:(context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.translate(
              offset: Offset(0, _moveAnimation.value),
              child: Transform.rotate(
                angle: _rotateAnimation.value,
                child: Container(
                  color: Colors.amber,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          );
        },),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=>AllAnimation());
        },
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward_ios),
      ), 
    );
  }
}