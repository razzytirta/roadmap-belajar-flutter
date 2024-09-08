import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isLigtBlue = true;

  bool get isLigtBlue => _isLigtBlue;

  set isLigtBlue(bool value) {
    _isLigtBlue = value;
    notifyListeners();
  }

  Color get color => (_isLigtBlue) ? Colors.lightBlue : Colors.amber;
}
