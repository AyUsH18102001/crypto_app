import 'package:flutter/cupertino.dart';

class SettingsProvider with ChangeNotifier{
  bool _isDarkMode = false;
  bool _isIphoneView = false;

  bool get isDarkMode => _isDarkMode;
  bool get isIphoneView => _isIphoneView;

  set isDarkMode(bool value){
    _isDarkMode = value;
    notifyListeners();
  }

  set isIphoneView(bool value){
    _isIphoneView = value;
    notifyListeners();
  }
}