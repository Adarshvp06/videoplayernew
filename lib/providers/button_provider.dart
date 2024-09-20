import 'package:flutter/material.dart';

class Buttonprovider extends ChangeNotifier {
  bool _ispaused = false;
  bool _isrotated = false;

  bool get paused => _ispaused;
  bool get rotation => _isrotated;
  void pausedbutton() {
    _ispaused = !_ispaused;
    notifyListeners();
  }

  void rotatebutton() {
    _isrotated = !_isrotated;
    notifyListeners();
  }
}
