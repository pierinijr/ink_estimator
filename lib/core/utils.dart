import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/door_model.dart';
import 'package:ink_estimator/model/ink_model.dart';
import 'package:ink_estimator/model/window_model.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';

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
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: AppColors.secondaryColor,
        fontSize: 12);
  }

  static Future<void> showAlertResult(
      BuildContext context, InkModel result) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.secondaryColor,
        title: LabelH2(
          label: AppLocalizations.of(context)!.result,
          fontWeightType: FontWeight.w700,
        ),
        content: Column(
          children: [
            LabelH2(
              label: AppLocalizations.of(context)!.introAlertResult,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: LabelH2(
              label: AppLocalizations.of(context)!.close,
              fontWeightType: FontWeight.w700,
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      ),
    );
  }

  static dynamic validateParameters(String text, String type) {
    switch (type) {
      case "double":
        return text.isNotEmpty ? double.parse(text) : 0.0;
      case "int":
        return text.isNotEmpty ? int.parse(text) : 0;
      default:
        return 0;
    }
  }

  static String quantityValidation(int value, String term) {
    if (value == 1) {
      return "1 $term";
    } else if (value > 1) {
      return "$value ${term}s";
    }
    return "";
  }

  static double centimetersToMeters(double value) {
    return value / 100;
  }

  static double metersToCentimeters(double value) {
    return value * 100;
  }

  static double areaCalculator(double height, double width) {
    return height * width;
  }

  static double doorsAndWindowsAreaCalculator(int doors, int windows) {
    return (DoorModel().area * doors) + (WindowModel().area * windows);
  }
}
