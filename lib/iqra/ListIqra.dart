import 'package:flutter/material.dart';
import 'basic_layout.dart';
import 'dart:convert';


class ListIqra extends StatelessWidget {
  final int level;
  // final List getData;
  ListIqra({this.level});

  // List<Iqra> parseJosn(String response) {
  //   if(response==null){
  //     return [];
  //   }
  //   final parsed =
  //       json.decode(response.toString()).cast<Map<String, dynamic>>();
  //   return parsed.map<Iqra>((json) => new Iqra.fromJson(json)).toList();
  // }

  // @override
  // Widget build(BuildContext context) {
  //         return PageView.builder(
  //           itemCount: 6,
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
  //                   level: level,
  //                   maxWidth: maxWidth,
  //                   maxHeight: maxHeight,
  //                 ),
  //               );
  //             });
  //           },
  //         );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        builder: (context, snapshot) {
          var dataJson = json.decode(snapshot.data.toString());
          return dataJson != null
              ? _listTile(dataJson)
              : new Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Widget _listTile(List data) {
    //   developer.log(
    //   'log me',
    //   name: 'my.app.category',
    //   error: jsonEncode(data[0]['iqra1']['page1']['row1']),
    // );
    var page = data[level]['iqra${level+1}'];
    return PageView.builder(
      itemCount: page == null ? 0 : page.length,
      itemBuilder: (context, index) {
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double maxHeight = constraints.maxHeight;
          double maxWidth = constraints.maxWidth;
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: BasicLayout(
              data: page['page${index+1}'],
              level: level,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
          );
        });
      },
    );
  }
}

// class Iqra {
//   final String iqra;
//   final String page;
//   final String row, column,alph;

//   Iqra({this.iqra, this.page, this.alph, this.column, this.row});

//   factory Iqra.fromJson(Map<String, dynamic> json){
//     return new Iqra(
//         iqra: json['iqra1'] as String,
//         page: json['iqra1']['page1'] as String,
//         alph: json['iqra1']['page1']['row1']['alph'] as String,
//         column: json['iqra1']['page1']['row1']['column'] as String,
//         row: json['iqra1']['page1']['row1'] as String,
//     );
//   }

// Map<String, dynamic> toJson() => {
//       'iqra1': iqra,
//       'page1': page,
//       'row1': row,
//       'column': column,
//       'alph': alph
//     };
// }
