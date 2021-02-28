import 'package:flutter/material.dart';
import 'package:iqrayukk_v2/dragGame.dart';

class MenuMain extends StatelessWidget {
  // MenuMain(this.width);
  // final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(
          child: Text("Drag Game"),
          onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return DragGame();
          }));
        }),
      ),
    );
  }
}