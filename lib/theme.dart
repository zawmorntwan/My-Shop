import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData getTheme() {
  return ThemeData(
    fontFamily: lato,

    primaryColor: primaryColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),

    scaffoldBackgroundColor: Colors.white,
    errorColor: const Color(0xffF86666)
  );
}
