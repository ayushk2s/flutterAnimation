import 'package:flutter/material.dart';

class SunLarger extends StatefulWidget{
  @override
  State<SunLarger> createState() => _SunLargerState();
}

class _SunLargerState extends State<SunLarger> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 200),
                duration: const Duration(seconds: 2),
                builder: (context, size, child){
                  return Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.yellow,
                            blurRadius: size*0.5,
                            spreadRadius: size*0.5
                        ),
                        BoxShadow(
                            color: Colors.red,
                            blurRadius: size*0.5,
                            spreadRadius: size*0.5
                        ),
                      ]
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}