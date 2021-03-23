import 'package:flutter/material.dart';
import 'basic_layout.dart';
// import 'dart:convert';

class ListIqra extends StatelessWidget {
  final int level;
  // final List getData;
  ListIqra({this.level});

  @override
  Widget build(BuildContext context) {
          return PageView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, index) {
              return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double maxHeight = constraints.maxHeight;
                double maxWidth = constraints.maxWidth;
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: BasicLayout(
                    index: index,
                    level: level,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                  ),
                );
              });
            },
          );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //       future: DefaultAssetBundle.of(context)
  //     .loadString('data.json'),
  //       builder: (context, snapshot) {
  //         var data = json.decode(snapshot.data.toString());
  //         Map iqraMap = jsonDecode(data);
  //         var iqra = Iqra.fromJson(iqraMap);
  //         var page = iqra.page;
  //         // var list = data[1];
  //         // var page = data['iqra1'];
  //         return PageView.builder(
  //           itemCount: page == null ? 0 : page.length,
  //           itemBuilder: (BuildContext context, index) {
  //             return LayoutBuilder(
  //                 builder: (BuildContext context, BoxConstraints constraints) {
  //               double maxHeight = constraints.maxHeight;
  //               double maxWidth = constraints.maxWidth;
  //               return Container(
  //                 color: Colors.white,
  //                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
  //                 child: BasicLayout(
  //                   index: index,
  //                   data: data,
  //                   level: level,
  //                   alph: iqra.alph,
  //                   col: iqra.column,
  //                   row: iqra.row,
  //                   maxWidth: maxWidth,
  //                   maxHeight: maxHeight,
  //                 ),
  //               );
  //             });
  //           },
  //         );
  //       });
  // }
}

class Iqra {
  final String iqra, page;
  final int row, column;
  final List<String> alph;

  Iqra(this.iqra, this.page, this.alph, this.column, this.row);

  Iqra.fromJson(Map<String, dynamic> json)
      : iqra = json['iqra1'],
        page = json['iqra1']['page1'],
        row = json['iqra1']['page1']['row1'],
        column = json['iqra1']['page1']['row1']['column'],
        alph = json['iqra1']['page1']['row1']['alph'];

  Map<String, dynamic> toJson() =>
    {
      'iqra1': iqra,
      'page1': page,
      'row1': row,
      'column': column,
      'alph': alph
    };
}