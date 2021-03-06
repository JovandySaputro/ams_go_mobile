import 'package:ams_go_mobile/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:ams_go_mobile/widget/navigation_drawer_widget2.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Favourites'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff0096ff), Color(0xff6610f2)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight),
            ),
          ),
        ),
      );
}
