import 'package:flutter/material.dart';
import 'MenuNonton.dart';
import 'MenuBelajar.dart';
import 'MenuMain.dart';

void main() {
  runApp(new MaterialApp(home: new MenuUtama(), routes: <String, WidgetBuilder>{
    '/MenuNonton': (BuildContext context) => MenuNonton(),
    '/MenuBelajar': (BuildContext context) => MenuBelajar(),
    '/MenuMain': (BuildContext context) => MenuMain(),
  }, theme: ThemeData(),)
  );
}

// ignore: must_be_immutable
class MenuUtama extends StatelessWidget {
  List<String> bghome = ["MenuBelajar", "MenuNonton", "MenuMain"];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // body: Text("Hello"),
      body: Center(
        // child: Image.asset("assets/image/bgMenuNonton.png"),
        child: new PageView.builder(
          itemCount: bghome.length,
          itemBuilder: (BuildContext context, i) {
            return new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/image/background/bg${bghome[i]}.png")),
              ),
              child: IconButton(
                icon: Image.asset("assets/image/${bghome[i]}.png"),
                onPressed: () {
                  Navigator.pushNamed(context, '/${bghome[i]}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
