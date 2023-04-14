import 'package:flutter/foundation.dart';

class TabViewModel with ChangeNotifier{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}