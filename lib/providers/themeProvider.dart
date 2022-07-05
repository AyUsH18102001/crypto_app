import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleThemeMode(bool value){
    value ? _themeMode = ThemeMode.dark : _themeMode = ThemeMode.light;
    notifyListeners();
  }
}