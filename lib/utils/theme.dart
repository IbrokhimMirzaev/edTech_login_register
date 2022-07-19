import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.grey.shade300,
    backgroundColor: Colors.grey.shade100,
    iconTheme: const IconThemeData(color: MyColors.inkDark),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.black,),
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    canvasColor: MyColors.inkDark,
    cardColor: Colors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(color: MyColors.inkDark),
      headline2: TextStyle(color: MyColors.successColor),
      headline3: TextStyle(color: MyColors.inkDark),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.inkDark,
    backgroundColor: const Color(0xFF2C281F),
    cardColor: MyColors.inkDark,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.inkDark,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyColors.inkDark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    canvasColor: Colors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: MyColors.primaryColor),
      headline3: TextStyle(color: MyColors.inkLightGrey),
    ),
  );
}
