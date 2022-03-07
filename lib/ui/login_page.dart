import 'dart:ffi';

import 'package:ams_go_mobile/ui/home/home_main.dart';
import 'package:ams_go_mobile/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEdUsernameController = TextEditingController();
  TextEditingController textEdPasswordController = TextEditingController();
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  bool cekRemember = false;
  bool isHidePass = true;

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
                      colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
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
                      colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
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
                margin: EdgeInsets.fromLTRB(20, 230, 20, 5),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFFFF4891),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFF4891))),
                          labelText: "Username :",
                          labelStyle: TextStyle(color: Color(0xFFFF4891))),
                    ),
                    TextField(
                      obscureText: isHidePass,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color(0xFFFF4891),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF4891))),
                        labelText: "Password :",
                        labelStyle: TextStyle(color: Color(0xFFFF4891)),
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
                        activeColor: Color(0xFFFF4891),
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
                            TextStyle(color: Color(0xFFFF4891), fontSize: 14),
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
              colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.amber,
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MainHome();
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

  TextField txtInputUsername() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: "Username",
          hintText: "masukan username",
          prefixStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (value) {
        setState(() {});
      },
      controller: textEdUsernameController,
    );
  }

  TextField txtInputPass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: "Password",
          hintText: "masukan Password",
          prefixStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (value) {
        setState(() {});
      },
      controller: textEdPasswordController,
    );
  }
}
