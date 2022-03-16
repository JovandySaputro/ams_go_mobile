import 'package:flutter/material.dart';

AppBar AppBarDefault(String title) {
  return AppBar(
    title: Text(
      title,
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
  );
}
