import 'dart:ffi';

import 'package:ams_go_mobile/data/sharedpref/sharedpref.dart';
import 'package:ams_go_mobile/ui/home/home_main.dart';
import 'package:ams_go_mobile/ui/home/home_side_bar.dart';
import 'package:ams_go_mobile/ui/home/home_page.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  TextEditingController vUsername = TextEditingController();
  TextEditingController vPassword = TextEditingController();
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  bool cekRemember = false;
  bool isHidePass = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    checkFirstScreen();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  void checkFirstScreen() async {
    String prefUsername = (await SharedPref.getString('username') ?? "");
    String prefPass = (await SharedPref.getString('password') ?? "");
    bool prefRemember = (await SharedPref.getBool('remember') ?? false);
    setState(() {
      if (prefRemember == true) {
        vUsername.text = prefUsername;
        vPassword.text = prefPass;
        cekRemember = prefRemember;
      } else {}
    });
  }

  void saveData(String user, String pass) async {
    await SharedPref.saveStateLogin(user, pass, cekRemember);
  }

  void removeData() async {
    await SharedPref.removeUserPass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Stack(
        children: [
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xff0096ff), Color(0xff6610f2)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -getBigDiameter(context) / 4,
            top: -getBigDiameter(context) / 4,
            child: Container(
              child: Center(
                child: Text(
                  "AMS",
                  style: TextStyle(
                      fontFamily: "PressStart2P",
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xff0096ff), Color(0xff6610f2)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            right: -getBigDiameter(context) / 2,
            bottom: -getBigDiameter(context) / 2,
            child: Container(
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFF3E9EE)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.fromLTRB(20, 300, 20, 5),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                child: Column(
                  children: [
                    TextField(
                      controller: vUsername,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xff6610f2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff6610f2))),
                          labelText: "Username :",
                          labelStyle: TextStyle(color: Color(0xff6610f2))),
                    ),
                    TextField(
                      obscureText: isHidePass,
                      controller: vPassword,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color(0xff6610f2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff6610f2))),
                        labelText: "Password :",
                        labelStyle: TextStyle(color: Color(0xff6610f2)),
                        suffixIcon: IconButton(
                            icon: Icon(isHidePass
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isHidePass = !isHidePass;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Color(0xff6610f2),
                        value: this.cekRemember,
                        onChanged: (bool? value) {
                          setState(() {
                            this.cekRemember = value!;
                          });
                        },
                      ),
                      Text(
                        "Remember Me",
                        style:
                            TextStyle(color: Color(0xff6610f2), fontSize: 14),
                      ),
                    ],
                  )),
              btnLogin(context)
            ]),
          )
        ],
      ),
    );
  }

  Container btnLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [Color(0xff0096ff), Color(0xff6610f2)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.amber,
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (cekRemember == false) {
                removeData();
              } else {
                saveData(vUsername.text, vPassword.text);
              }

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Home();
              }));
            },
            child: Center(
                child: Text(
              "LOGIN",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          )),
    );
  }
}
