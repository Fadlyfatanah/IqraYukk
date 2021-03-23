import 'package:flutter/material.dart';


class BasicLayout extends StatelessWidget {
  final int row, col, level, index;
  final double maxHeight, maxWidth;
  final List alph;
  final data;
  BasicLayout({
      this.index,
      this.data,
      this.level,
      this.col,
      this.row,
      this.alph,
      this.maxHeight,
      this.maxWidth});



  @override
  Widget build(BuildContext context) {
    // var datas = data['iqra$level']['page$index'];
    // var rows = datas.length;
    // var cols;
    return Scaffold(
      body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(8, (n) {
            int indek = 1;
            int flexs;
                // List alph = data;
            if (n == 0) {
              flexs = 2;
            } else {
              flexs = 1;
            }
            return Expanded(
              flex: flexs,
              child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: TextDirection.rtl,
          children: List.generate(2, (x) {
            return Row(children: List.generate(indek, (y){
              indek++;
              return Container(
                width: maxWidth * 0.1,
                height: maxHeight * 0.12,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                // color: Colors.cyan,
                child: Image.asset(
                    "assets/image/hijaiyah/a.png"), //dynamic index
              );
            })
            );
          }
            )
              )
            );
              
          })
          ),
    );
  }
}


// children: List.generate(col, (y) {
//                     //dynamic index //perulangan untuk membuat kolom ke-2
//                     return Row(
//                         textDirection: TextDirection.rtl,
//                         children: List.generate(row, (z) {
//                           //dynamic index //perulangan untuk membuat baris ke-2
//                           var image = imageList[index];
//                           index++;
//                           // if(index < imageList.length){
//                           //   index++;
//                           // }
//                           // else{
//                           //   index=null;
//                           // }
//                           return Container(
//                             width: maxWidth * 0.1,
//                             height: maxHeight * 0.12,
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 8, vertical: 10),
//                             // color: Colors.cyan,
//                             child: Image.asset(
//                                 "assets/image/hijaiyah/$image.png"), //dynamic index
//                           );
//                         }));
//                   })
