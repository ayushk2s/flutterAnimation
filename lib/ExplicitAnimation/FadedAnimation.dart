import 'package:flutter/material.dart';

class FadedAnimation extends StatefulWidget{

  @override
  State<FadedAnimation> createState() => _FadedAnimationState();
}

class _FadedAnimationState extends State<FadedAnimation> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> fadedValue;
  late Animation<Offset> textAnimation;

  @override
  void initState() {
    super.initState();
    myfun();
  }
  myfun(){
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2));
    fadedValue = Tween<double>(begin: 0, end: 1).animate(controller);
    textAnimation = Tween<Offset>(begin: Offset(0.0, 1), end: Offset.zero).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeInOutBack));
    controller.forward();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: fadedValue,
          child: Column(
            children: [
              Icon(Icons.favorite, size: 200,),
              SlideTransition(
                position: textAnimation,
                  child: Text('Radhey Radhey', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pinkAccent, fontSize: 24),))
            ],
          ),
        )
      )
    );
  }
}