import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  final int level;
  final double maxHeight, maxWidth;
  final Map<String, dynamic> data;
  BasicLayout({this.data, this.level, this.maxHeight, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    int row = data.length;
    return Scaffold(
      body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(row, (n) {
            int flexs = 1;
            String colIndex = data['row${n + 1}']['column'];
            int col = int.parse(colIndex);
            List alph = data['row${n + 1}']['alph'];
            int index = -1;

            if (n == 0) {
              flexs = 2;
            }
            return Expanded(
                flex: flexs,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textDirection: TextDirection.rtl,
                    children: List.generate(col, (x) {
                      return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.max,
                          textDirection: TextDirection.rtl,
                          children: List.generate(alph.length ~/ col, (y) {
                            index++;
                            return Container(
                                // width: maxWidth * 0.06,
                                // height: maxHeight * 0.1,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 10),
                                // color: Colors.cyan,
                                child: Image.asset(
                                    "assets/image/hijaiyah/${alph[index]}.png"), //dynamic index
                            );
                          }));
                    })));
          })),
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
