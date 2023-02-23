import 'package:flutter/cupertino.dart';

class ToggleNotifier extends ChangeNotifier {
  bool _isOnline = true;

  bool get isOnline => _isOnline;

  void toggleOn() {
    _isOnline = true;
    notifyListeners();
  }

  void toggleOff() {
    _isOnline = false;
    notifyListeners();
  }
}
