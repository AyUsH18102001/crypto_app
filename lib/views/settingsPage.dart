import 'package:crypto_app/providers/settingsProvider.dart';
import 'package:crypto_app/providers/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/utils/colors.dart' as color;
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .appBarTheme
              .backgroundColor,
          iconTheme: Theme
              .of(context)
              .appBarTheme
              .actionsIconTheme,
          leading: whichIconToReturn(context),
          title: Text(
            'Settings',
            style: Theme
                .of(context)
                .textTheme
                .headline1,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Container(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Dark Mode',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline3,
                        ),
                      ),
                      Consumer<SettingsProvider>(
                          builder: (context, value, child) {
                            return Switch.adaptive(
                              value: value.isDarkMode,
                              onChanged: (bool toggleValue) {
                                context
                                    .read<SettingsProvider>()
                                    .isDarkMode = toggleValue;
                                Provider.of<ThemeProvider>(
                                    context, listen: false).toggleThemeMode(
                                    toggleValue);
                              },
                              activeColor: color.ColorPalette.activeColor
                                  .withOpacity(0.3),
                              inactiveThumbColor: color.ColorPalette
                                  .inactiveColor.withOpacity(0.3),
                              inactiveTrackColor: color.ColorPalette
                                  .inactiveColor,
                              activeTrackColor: color.ColorPalette.activeColor
                                  .withOpacity(0.8),
                            );
                          }
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Theme
                          .of(context)
                          .iconTheme
                          .color!
                          .withOpacity(0.7),
                      thickness: 1,
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Iphone View',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline3,
                        ),
                      ),
                      Consumer<SettingsProvider>(
                          builder: (context, value, child) {
                            return Switch.adaptive(
                              value: value.isIphoneView,
                              onChanged: (bool toggleValue) {
                                context
                                    .read<SettingsProvider>()
                                    .isIphoneView = toggleValue;
                              },
                              activeColor: color.ColorPalette.activeColor
                                  .withOpacity(0.3),
                              inactiveThumbColor: color.ColorPalette
                                  .inactiveColor.withOpacity(0.3),
                              inactiveTrackColor: color.ColorPalette
                                  .inactiveColor,
                              activeTrackColor: color.ColorPalette.activeColor
                                  .withOpacity(0.8),
                            );
                          }
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget whichIconToReturn(BuildContext context) {
    if (Provider
        .of<SettingsProvider>(context)
        .isIphoneView) {
      return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme
              .of(context)
              .appBarTheme
              .actionsIconTheme!
              .color,
          size: 20,
        ),
      );
    }
    else {
      return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Theme
              .of(context)
              .appBarTheme
              .actionsIconTheme!
              .color,
          size: 20,
        ),
      );
    }
  }
}