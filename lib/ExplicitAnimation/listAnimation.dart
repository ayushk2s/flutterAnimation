import 'package:flutter/material.dart';

class listAnimation extends StatefulWidget{
  @override
  State<listAnimation> createState() => _listAnimationState();
}

class _listAnimationState extends State<listAnimation> with SingleTickerProviderStateMixin{
  late List<Animation<Offset>> animatedList = [];
  late AnimationController controller;
  int itemCount = 5;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    animatedList = List.generate(
      itemCount,
          (index) {
        double start = (index * 0.5) / itemCount;
        double end = (index + 1) * 0.5 / itemCount;
        return Tween(begin: Offset(-1, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(start, end, curve: Curves.easeInOut),
          ),
        );
      },
    );


    controller.forward();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: itemCount,
            itemBuilder: (context, index){
              int c = index;
              return SlideTransition(
                position: animatedList[index],
                child: ListTile(
                  onTap: (){
                    controller.reverse();
                  },
                  title: Text('Name $c'),
                ),
              );
            })
      ),
    );
  }
}