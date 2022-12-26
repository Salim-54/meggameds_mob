import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    textTheme: themeText(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: sTextGreyColor),
      gapPadding: 10);

  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
  );
}

TextTheme themeText() {
  return TextTheme(
    bodyText1: TextStyle(color: sTextBlackColor),
    bodyText2: TextStyle(color: sTextGreyColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: Colors.black),
    toolbarTextStyle: TextTheme(
      headline3: TextStyle(
        color: sTextGreyColor,
      ),
    ).bodyText2,
    titleTextStyle: TextTheme(
      headline3: TextStyle(
        color: sTextGreyColor,
        fontSize: 25,
        fontFamily: "Muli",
        fontWeight: FontWeight.bold,
      ),
    ).headline3,
  );
}
