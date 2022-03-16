// import 'dart:collection';
// import 'dart:developer';
// import 'package:google_fonts/google_fonts.dart';

import 'package:ams_go_mobile/data/sharedpref/sharedpref.dart';
import 'package:ams_go_mobile/ui/login_page.dart';
import 'package:ams_go_mobile/ui/splashscreen/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'components/costom_progress_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel? channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(const MyApp());
  configLoading();
  await SharedPref.init();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = "title";
  String content = "Content";

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel!.id,
              channel!.name,
              channel!.description,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      //navigation to page
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      builder: EasyLoading.init(),
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
