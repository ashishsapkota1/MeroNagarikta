import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: const Color(0xFF03C03C)
    );
  }
}
