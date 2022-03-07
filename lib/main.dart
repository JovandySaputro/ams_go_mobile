// import 'dart:collection';
// import 'dart:developer';
// import 'package:google_fonts/google_fonts.dart';

import 'package:ams_go_mobile/model/navigation_item.dart';
import 'package:ams_go_mobile/provider/navigation_provider.dart';
import 'package:ams_go_mobile/ui/home/home_page.dart';
import 'package:ams_go_mobile/ui/login_page.dart';
import 'package:ams_go_mobile/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

//imageview
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("belajar image view"),
//         ),
//         body: Center(
//           child: Container(
//             width: 200,
//             height: 200,
//             padding: const EdgeInsets.all(15),
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 image: CachedNetworkImageProvider(
//                     'https://pict-a.sindonews.net/dyn/620/pena/news/2021/09/08/700/535592/10-karakter-paling-cengeng-yang-pernah-ada-di-jagat-anime-ywv.jpg'),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//stack layout menumpuk
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Widget> _list = [];
//   int conter = 1;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Latihan Stack dan Align"),
//         ),
//         body: Stack(children: [
//           //background
//           Column(
//             children: [
//               Flexible(
//                   flex: 1,
//                   child: Row(
//                     children: [
//                       Flexible(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.red,
//                           )),
//                       Flexible(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.yellow,
//                           ))
//                     ],
//                   )),
//               Flexible(
//                   flex: 1,
//                   child: Row(
//                     children: [
//                       Flexible(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.green,
//                           )),
//                       Flexible(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.blue,
//                           ))
//                     ],
//                   ))
//             ],
//           ),
//           //listview
//           ListView(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.all(15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: _list,
//                       )),
//                 ],
//               )
//             ],
//           ),
//           //button
//           Align(
//             alignment: Alignment(0.75, 0.75),
//             child: RaisedButton(
//               child: Text("Button"),
//               color: Colors.amber,
//               onPressed: () {
//                 setState(() {
//                   _list.add(
//                     Text(
//                       "Data ke - " + conter.toString(),
//                       style: GoogleFonts.mcLaren(
//                         fontSize: 30,
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     )
//                   );
//                   conter++;
//                 });
//               },
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }


//fleksible layout
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("fleksible layout"),
//         ),
//         body: Column(children: [
//           Flexible(
//             flex: 1,
          
//             child: Row(
//               children: [
//                 Flexible(
//                     flex: 1,
//                     child: Container(
//                       color: Colors.red,
                      
//                     )),
//                 Flexible(
//                     flex: 1,
//                     child: Container(
//                       color: Colors.blue,
//                     )),
//                 Flexible(
//                     flex: 1,
//                     child: Container(
//                       color: Colors.purple,
//                     ))
//               ],
//             ),
//           ),
//           Flexible(
//               flex: 2,
//               child: Container(
//                 color: Colors.yellow,
//               )),
//           Flexible(
//               flex: 1,
//               child: Container(
//                 color: Colors.green,
//               ))
//         ]),
//       ),
//     );
//   }
// }



//listview
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Widget> _list = [];
//   int conter = 1;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text("Demo"),
//           ),
//           body: ListView(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   RaisedButton(
//                     child: Text("tambah"),
//                     onPressed: () {
//                       setState(() {
//                         _list.add(
//                           Text(
//                             "Data ke - " + conter.toString(),
//                             style: GoogleFonts.mcLaren(
//                               fontSize: 30,
//                               decoration: TextDecoration.lineThrough,
//                             ),
//                           ),
//                         );
//                         conter++;
//                       });
//                     },
//                   ),
//                   RaisedButton(
//                     child: Text("kurang"),
//                     onPressed: () {
//                       setState(() {
//                         _list.removeLast();
//                         conter--;
//                       });
//                     },
//                   )
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: _list,
//               )
//             ],
//           )),
//     );
//   }
// }

//desain buttun dengan warna gradasi
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           color: Colors.red,
//           margin: EdgeInsets.fromLTRB(10, 50, 20, 30),
//           padding: EdgeInsets.only(bottom: 50),
//           child: Container(
//             margin: EdgeInsets.all(15),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: <Color>[Colors.amber, Colors.blue])),
//           ),
//         ),
//       ),
//     );
//   }
// }
