import 'package:flutter/material.dart';

class likeExpanded extends StatefulWidget {
  @override
  State<likeExpanded> createState() => _likeExpandedState();
}

class _likeExpandedState extends State<likeExpanded> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                          color: expanded ? Colors.pinkAccent : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                          )),
                    ),
                  ),
                  AnimatedPositioned(
                      duration:  Duration(seconds: 1),
                      top: expanded ? 17 : 50,
                      curve: Curves.easeInCubic,
                      child: Column(
                        children: [
                          if(expanded)
                            Text('Hii', style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                        ],
                      )
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: expanded ? md.width / 3 : md.width / 5,
                height: md.width / 8,
                decoration: BoxDecoration(
                    color: expanded ? Colors.pinkAccent : Colors.green,
                    borderRadius: expanded ? BorderRadius.circular(20) : BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (expanded)
                      AnimatedOpacity(
                          ///It helps opacity let the text show when on tap and remove on second tap reverse it to know the difference
                          opacity: expanded ? 1 : 0,
                          curve: Curves.easeInOut,
                          duration: const Duration(seconds: 2000),
                          child: Text(
                            'I like you',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    Icon(expanded ? Icons.favorite : Icons.favorite_border, size: md.width/9,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
