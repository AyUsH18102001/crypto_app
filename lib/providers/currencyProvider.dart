import 'package:flutter/cupertino.dart';

class CurrencyProvider with ChangeNotifier{
  String _selectedCurrency = 'INR';

  String get selectedCurrency => _selectedCurrency;

  set selectedCurrency(String value){
    _selectedCurrency = value;
    notifyListeners();
  }
}