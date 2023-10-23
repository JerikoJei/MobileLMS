import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  int selectedIndex = 0;

  void changePage(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
