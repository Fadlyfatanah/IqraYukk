import 'package:flutter/material.dart';
import 'iqra/ListIqra.dart';

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
            return ElevatedButton(
                child: Image.asset('assets/image/cover/iqra${i+1}-cover.png'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ListIqra(level: i);
                    },
                  ));
                });
          }));
    }));
  }
}
