import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData getTheme() {
  return ThemeData(
    fontFamily: lato,

    primaryColor: primaryColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: appBarBackgroundColor,
      elevation: 0,
    ),

    scaffoldBackgroundColor: Colors.white,
  );
}
