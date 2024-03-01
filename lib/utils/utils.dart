import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: const Color(0xFF03C03C)
    );
  }
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(8),
          forwardAnimationCurve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }
}
