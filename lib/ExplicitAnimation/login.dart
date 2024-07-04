import 'package:animationlearning/ExplicitAnimation/FadedAnimation.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with TickerProviderStateMixin {
  late Animation<Offset> positionChange;
  late Animation<double> changeSize;
  late AnimationController controller;
  late Animation<double> opacityChange;
  @override
  void initState() {
    super.initState();
    ///one controller can work on multiple values
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    changeSize = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    positionChange = Tween<Offset>(begin: Offset(-1, -2),  end: Offset.zero).animate(
        CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOutBack));
    opacityChange = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack));
    ///which the help of addListener you can perform many function with controller
    ///like completion what is the value and many more
    opacityChange.addListener((){
      print(controller.value);
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              FadeTransition(
                opacity: opacityChange,
                child: Icon(Icons.person, color: Colors.green, size: md.width/4,),
              ),
              SlideTransition(
                position: positionChange,
                child: ScaleTransition(
                  scale: changeSize,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30,),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'What do people call you?',
                          labelText: 'Name *',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.real_estate_agent),
                          hintText: 'Why do people call you?',
                          labelText: 'Explain',
                        ),
                      )
                    ],
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
