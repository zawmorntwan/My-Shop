import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

class Services {
  static showToast({
    required String message,
    required bool isBottom,
    Color? backgroundColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: isBottom ? ToastGravity.BOTTOM : ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor?? primaryColor,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
}