import 'package:ams_go_mobile/ui/List_Page.dart';
import 'package:ams_go_mobile/ui/profile_page.dart';
import 'package:ams_go_mobile/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_sidebar/flutter_sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(
          "HOME",
          style: TextStyle(color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff0096ff), Color(0xff6610f2)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 45,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xffF18265),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListPage();
              }));
            },
            child: Text(
              "HOME",
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
