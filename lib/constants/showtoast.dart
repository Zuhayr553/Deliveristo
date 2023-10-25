import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToasterror(String label) {
  Fluttertoast.showToast(
      msg: label,
      textColor: white,
      gravity: ToastGravity.CENTER,
      backgroundColor: black);
}

showToasterrorLongLength(String label) {
  Fluttertoast.showToast(
      msg: label,
      toastLength: Toast.LENGTH_LONG,
      textColor: white,
      gravity: ToastGravity.CENTER,
      backgroundColor: black);
}
