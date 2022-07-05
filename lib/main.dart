import 'package:crypto_app/providers/currencyProvider.dart';
import 'package:crypto_app/providers/settingsProvider.dart';
import 'package:crypto_app/providers/themeProvider.dart';
import 'package:crypto_app/utils/themes.dart';
import 'package:crypto_app/viewModel/assetListViewModel.dart';
import 'package:crypto_app/views/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context)=>ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context)=>CurrencyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context)=>AssetListViewModel(),
        ),
      ],
      builder: (context,child){
        final themeProvider = Provider.of<ThemeProvider>(context).themeMode;
        return MaterialApp(
          themeMode: themeProvider,
          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          home: HomePage(),
        );
      }
    );
  }
}