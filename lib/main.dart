import 'package:flutter/material.dart';
import 'bgchome0.dart';
import 'bgchome1.dart';
import 'bgchome2.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/MenuNonton': (context) => Bgchome0(),
      //'/MenuBelajar': (context) => Bgchome1(),
      //'/MenuMain': (context) => Bgchome2(),
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  List<String> bghome = ["MenuNonton", "MenuBelajar", "MenuMain"];
  int i;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        //color: Color.fromRGBO(r, g, b, opacity),
        child: new PageView.builder(
          itemCount: bghome.length,
          itemBuilder: (BuildContext context, i) {
            return IconButton(
              icon: Image.asset("image/${bghome[i]}.png"),
              onPressed: () {
                Navigator.pushNamed(context, '/${bghome[i]}');
              },
            );
          },
        ),
      ),
    );
  }
}
