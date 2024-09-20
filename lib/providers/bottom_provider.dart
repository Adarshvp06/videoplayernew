import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {

int _currentindex=0;

int get currentinddex=> _currentindex;

void changeindex(int index){
_currentindex=index;
notifyListeners();
}

}