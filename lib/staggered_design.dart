
import 'package:animation_test_prj/bounce_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class StaggeredDesignPage extends StatefulWidget {
  const StaggeredDesignPage({super.key, required this.title});


  final String title;

  @override
  State<StaggeredDesignPage> createState() => _StaggeredDesignPageState();
}

class _StaggeredDesignPageState extends State<StaggeredDesignPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation1;
  late Animation<Offset> _slideAnimation1;
  late Animation<double> _fadeAnimation2;
  late Animation<Offset> _slideAnimation2;
  void _nextPage() {
    Get.to(()=>BounceScaleAnimationPage());
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
 @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _animationController.addListener(() {
      setState(() {
        
      });
    },);
    _animationController.addStatusListener((stauts){
      if (stauts.isCompleted) {
        _animationController.reverse();
      }else if(stauts.isDismissed){
        _animationController.forward();
      }
      setState(() {
        
      });
    });
    _fadeAnimation1 = Tween<double>(begin: 0.0,end: 0.5).animate(CurvedAnimation(parent: _animationController, curve:Interval(0.0, 0.5,curve: Curves.easeIn)));
    _slideAnimation1 = Tween<Offset>(begin: Offset(0, 0.5),end: Offset.zero).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.0, 0.5,curve: Curves.easeIn)));
    _fadeAnimation2 = Tween<double>(begin: 0.5,end: 1.0).animate(CurvedAnimation(parent: _animationController, curve:Interval(0.5, 1.0,curve: Curves.easeIn)));
    _slideAnimation2 = Tween<Offset>(begin: Offset(0.5, 0.5),end: Offset.zero).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.5, 1.0,curve: Curves.easeIn)));
    _animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
         
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
       
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(position: _slideAnimation1,
            child: FadeTransition(
             opacity: _fadeAnimation1,
             child: Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
              child: Center(
                child: Text("One",style: TextStyle(color: Colors.white),),
              ),
             ),

            ),
            ),
            SlideTransition(position: _slideAnimation2,
            child: FadeTransition(
             opacity: _fadeAnimation2,
             child: Container(
              width: 150,
              height: 80,
               decoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),
              child: Center(
                child: Text("Two",style: TextStyle(color: Colors.white),),
              ),
             ),
            
            ),
            )
          ],
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