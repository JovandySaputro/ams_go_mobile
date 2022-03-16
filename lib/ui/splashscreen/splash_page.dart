import 'dart:async';
import 'package:ams_go_mobile/components/progress_bar_pln.dart';
import 'package:ams_go_mobile/ui/home/home_page.dart';
import 'package:ams_go_mobile/ui/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (isLogin == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ProgBarPln(),
      ),
    );
  }
}
