import 'package:flutter/material.dart';

class WelcomeViewModel extends ChangeNotifier {
  int _indicatorsPages = 0;
  int get indicatorsPages {
    return _indicatorsPages;
  }

  void setWelcomeView(int indicatorsPages) {
    _indicatorsPages = indicatorsPages;
    notifyListeners();
  }
}
