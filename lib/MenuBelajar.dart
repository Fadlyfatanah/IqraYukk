import 'package:flutter/material.dart';
import 'dart:convert';

class MenuBelajar extends StatefulWidget {
  @override
  _MenuBelajarState createState() => _MenuBelajarState();
}

class _MenuBelajarState extends State<MenuBelajar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Builder(builder: (BuildContext context) {
        return GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              return ElevatedButton(
                  child: Image.asset(
                      'assets/image/cover/iqra${index + 1}-cover.png'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return FutureBuilder(
                            future: DefaultAssetBundle.of(context)
                                .loadString('assets/data.json'),
                            builder: (context, snapshot) {
                              var dataJson =
                                  json.decode(snapshot.data.toString());
                              Map<String, dynamic> getpage =
                                  dataJson[index]['iqra${index + 1}'];
                              return dataJson != null
                                  ? _listTile(getpage)
                                  : new Center(
                                      child: CircularProgressIndicator(),
                                    );
                            });
                      },
                    ));
                  });
            }));
      })),
    );
  }

  Widget _listTile(Map<String, dynamic> page) {
    return PageView.builder(
      itemCount: page.length,
      itemBuilder: (context, index) {
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: _iqraLayout(page, maxHeight, maxWidth),
          );
        });
      },
    );
  }

  Widget _iqraLayout(
      Map<String, dynamic> page, double maxHeight, double maxWidth) {
    int row = page.length;
    return Column(
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(row, (n) {
          int flexs = 1;
          String colIndex = page['row${n + 1}']['column'];
          int col = int.parse(colIndex);
          List alph = page['row${n + 1}']['alph'];
          int index = -1;
          if (n == 0) {
            flexs = 2;
          }
          return Expanded(
              flex: flexs,
              child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  textDirection: TextDirection.rtl,
                  children: List.generate(col, (x) {
                    // double spaceWidth = maxWidth / (alph.length * 8);
                    // double spaceHeight = maxHeight / 108;
                    return Expanded(
                      child: Container(
                        color: Colors.brown,
                        // margin: EdgeInsets.symmetric(
                        //     horizontal: spaceWidth),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            textDirection: TextDirection.rtl,
                            children: List.generate(alph.length ~/ col, (y) {
                              index++;
                              return Text(
                                alph[index],
                                style: TextStyle(
                                    fontFamily: 'Lateef', fontSize: 50),
                              );
                            })),
                      ),
                    );
                  })));
        }));
  }
}
