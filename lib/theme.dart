import 'package:flutter/material.dart';

import 'constants.dart';
import 'helpers/custom_route.dart';

ThemeData getTheme() {
  return ThemeData(
      fontFamily: lato,
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
          TargetPlatform.iOS: CustomPageTransitionBuilder(),
        },
      ),
      scaffoldBackgroundColor: Colors.white,
      errorColor: const Color(0xffF86666));
}
