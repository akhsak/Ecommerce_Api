import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int myIndex = 0;

  void onTap(int index) {
    myIndex = index;
    notifyListeners();
  }
}
