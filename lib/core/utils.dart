import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ink_estimator/themes/colors.dart';

class Utils {
  static void goView(
    BuildContext context,
    String name,
  ) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      name,
      ModalRoute.withName('/welcome'),
    );
  }

  static void showToast(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: AppColors.secondaryColor,
        fontSize: 12
    );
  }
}
