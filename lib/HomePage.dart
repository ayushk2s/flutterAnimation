import 'package:animationlearning/ExplicitAnimation/FadedAnimation.dart';
import 'package:animationlearning/ExplicitAnimation/listAnimation.dart';
import 'package:animationlearning/ExplicitAnimation/login.dart';
import 'package:animationlearning/ImplicitAnimation/containerColorChange.dart';
import 'package:animationlearning/ImplicitAnimation/likeExpanded.dart';
import 'package:animationlearning/ImplicitAnimation/sunlarger.dart';
import 'package:animationlearning/TransitionAnimation/TransitionAnimationFirst.dart';
import 'package:animationlearning/TransitionAnimation/TransitionAnimationSecond.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Explicit Animation',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
            InkWell(
              onTapDown: (TapDownDetails details) {
                Offset tapPosition = details.globalPosition;
                Navigator.of(context).push(
                  TransitionAnimationFromTap(
                    route: FadedAnimation(),
                    tapPosition: tapPosition,
                  ),
                );
              },
              child: Text('Faded Animation', style: TextStyle(fontSize: 20, color: Colors.red),),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTapDown: (TapDownDetails details) {
                Offset tapPosition = details.globalPosition;
                Navigator.of(context).push(
                  TransitionAnimationFromTap(
                    route: login(),
                    tapPosition: tapPosition,
                  ),
                );
              },
              child: Text('Login', style: TextStyle(fontSize: 20, color: Colors.red),),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTapDown: (TapDownDetails details) {
                Offset tapPosition = details.globalPosition;
                Navigator.of(context).push(
                  TransitionAnimationFromTap(
                    route: listAnimation(),
                    tapPosition: tapPosition,
                  ),
                );
              },
              child: Text('List Animation', style: TextStyle(fontSize: 20, color: Colors.red),),
            ),
            Divider(),
            Text('Implicit Animation',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
            InkWell(
              onTapDown: (TapDownDetails details) {
                Offset tapPosition = details.globalPosition;
                Navigator.of(context).push(
                  TransitionAnimationFromTap(
                    route: Containercolorchange(),
                    tapPosition: tapPosition,
                  ),
                );
              },
              child: Text('Container Color Change', style: TextStyle(fontSize: 20, color: Colors.blue),),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTapDown: (TapDownDetails details) {
                Offset tapPosition = details.globalPosition;
                Navigator.of(context).push(
                  TransitionAnimationFromTap(
                    route: likeExpanded(),
                    tapPosition: tapPosition,
                  ),
                );
              },
              child: Text('Expanding Like', style: TextStyle(fontSize: 20, color: Colors.blue),),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTapDown: (TapDownDetails details) {
                Offset tapPosition = details.globalPosition;
                Navigator.of(context).push(
                  TransitionAnimationFromTap(
                    route: SunLarger(),
                    tapPosition: tapPosition,
                  ),
                );
              },
              child: Text('Sun Enlarge', style: TextStyle(fontSize: 20, color: Colors.blue),),
            ),
          ],
        ),
      ),
    );
  }
}