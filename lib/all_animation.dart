import 'package:animation_test_prj/circle_loading_animation.dart';
import 'package:animation_test_prj/circle_loading_animation_2.dart';
import 'package:animation_test_prj/circle_loading_animation_3.dart';
import 'package:animation_test_prj/circle_loading_animation_4.dart';
import 'package:animation_test_prj/circle_loading_animation_5.dart';
import 'package:animation_test_prj/circle_loading_animation_6.dart';
import 'package:animation_test_prj/circle_loading_animation_7.dart';
import 'package:animation_test_prj/cricle_loading_animation_8.dart';
import 'package:flutter/material.dart';

class AllAnimation extends StatefulWidget {
  const AllAnimation({super.key});

  @override
  State<AllAnimation> createState() => _AllAnimationState();
}

class _AllAnimationState extends State<AllAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text("All Animation")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CircleLoadingAnimation(),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CircleLoadingAnimation2(),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CircleLoadingAnimation3(),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CircleLoadingAnimation4(),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CircleLoadingAnimation5 (),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CircleLoadingAnimation6(),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CircleLoadingAnimation7(),
          ),
           Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CircleLoadingAnimation8(),
          ),
        ],
      ),
    );
  }
}
