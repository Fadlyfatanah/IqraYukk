// import 'package:flutter/material.dart';
// import 'package:iqrayukk_v2/MenuMain.dart';
// import 'MenuNonton.dart';
// import 'MenuBelajar.dart';
// import 'MenuMain.dart';

// class MenuUtama extends StatelessWidget {
//   final List<String> bghome = ["MenuNonton", "MenuBelajar", "MenuMain"];
//   final int i = 0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/': (context) => MenuUtama(),
//         '/MenuNonton': (context) => MenuNonton(),
//         '/MenuBelajar': (context) => MenuBelajar(),
//         '/MenuMain': (context) => MenuMain(),
//       },
//       home: new Scaffold(
//         body: new Container(
//           //color: Color.fromRGBO(r, g, b, opacity),
//           child: new PageView.builder(
//             itemCount: bghome.length,
//             itemBuilder: (BuildContext context, i) {
//               return IconButton(
//                 icon: Image.asset("image/bg${bghome[i]}.png"),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/${bghome[i]}');
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
