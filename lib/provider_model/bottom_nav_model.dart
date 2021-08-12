import 'package:flutter/material.dart';

class BottomNavModel with ChangeNotifier {
  var _index = 0;

  int get index => _index;

  void select(int index) {
    _index = index;
    notifyListeners();
  }
}
