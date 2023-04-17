import 'package:flutter/foundation.dart';

class TabViewModel with ChangeNotifier{
  int currentIndex = 0;
  void updateCurrentIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}