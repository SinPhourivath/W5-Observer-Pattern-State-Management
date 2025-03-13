import 'package:flutter/material.dart';

class ColorCounters extends ChangeNotifier {
  int _currentIndex = 0;
  int _redTapCount = 0;
  int _blueTapCount = 0;

  int get currentIndex => _currentIndex;
  int get redTapCount => _redTapCount;
  int get blueTapCount => _blueTapCount;

  void changeIndexTo(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void incrementRedTapCount() {
    _redTapCount++;
    notifyListeners();
  }

  void incrementBlueTapCount() {
    _blueTapCount++;
    notifyListeners();
  }
}
