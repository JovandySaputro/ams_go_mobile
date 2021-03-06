import 'package:flutter/material.dart';
import 'package:ams_go_mobile/model/navigation_item.dart';

class NavigationProvider2 extends ChangeNotifier {
  NavigationItem _navigationItem = NavigationItem.header;

  NavigationItem get navigationItem => _navigationItem;

  void setNavigationItem(NavigationItem navigationItem) {
    _navigationItem = navigationItem;

    notifyListeners();
  }
}
