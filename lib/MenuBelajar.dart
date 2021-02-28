import 'package:flutter/material.dart';

class MenuBelajar extends StatefulWidget {
  @override
  _MenuBelajarState createState() => _MenuBelajarState();
}

class _MenuBelajarState extends State<MenuBelajar> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Builder(builder: (BuildContext context) {
      return GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (i) {
          i+=1;
          return Image.asset('assets/image/iqra$i-cover.png');
        }),
      );
    }));
  }
}
