import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future toastMessage(String text, Color color) {
  return Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
