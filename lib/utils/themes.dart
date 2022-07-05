import 'package:flutter/material.dart';
import 'package:crypto_app/utils/colors.dart' as color ;

class CustomTheme{
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor:Colors.white,
      bottomAppBarColor: Colors.grey.withOpacity(0.6),
      textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          headline2:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.8)
          ),
        headline3: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        headline4: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 23,
          fontWeight: FontWeight.w900,
        ),
        headline5: TextStyle(
          color: Colors.green.withOpacity(0.6),
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
        headline6: TextStyle(
          color: Colors.black.withOpacity(0.4),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: color.ColorPalette.appBar,
        actionsIconTheme: IconThemeData(
          color:  color.ColorPalette.lightThemeIcons
        )
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white.withOpacity(0.9),
      )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: color.ColorPalette.darkThemeScaffold,
      bottomAppBarColor: Colors.grey,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black.withOpacity(0.9),
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        headline2:TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white.withOpacity(0.8)
        ),
        headline3: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        headline4: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 23,
          fontWeight: FontWeight.w900,
        ),
        headline5: TextStyle(
          color: Colors.green.withOpacity(0.6),
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
        headline6: TextStyle(
          color: Colors.white.withOpacity(0.4),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      iconTheme: IconThemeData(
        color: color.ColorPalette.darkThemeIcons,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: color.ColorPalette.appBar,
          actionsIconTheme: IconThemeData(
              color:  color.ColorPalette.darkThemeIcons
          )
      ),
      dialogTheme: DialogTheme(
        backgroundColor: color.ColorPalette.darkThemeScaffold.withOpacity(0.9),
      )
  );

}