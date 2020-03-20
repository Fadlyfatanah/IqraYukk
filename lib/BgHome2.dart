import 'package:flutter/material.dart';

class BgHome2 extends StatelessWidget {
  BgHome2(this.width);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.timer),
            Stack(
              children: <Widget>[
                Container(
                  width: width*0.5,
                  height: 15,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
                ),
                Material(
                  borderRadius: BorderRadius.circular(5),
                  child: AnimatedContainer(duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  ),
                  
                )
              ],  
            )
          ],
          
        ),
      ),
    );
  }
}