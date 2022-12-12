import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/ink_model.dart';
import 'package:ink_estimator/model/room_model.dart';
import 'package:ink_estimator/view_model/room_view_model.dart';
import 'package:provider/provider.dart';

class Calculator {
  static double areaCalculator(BuildContext context) {
    List<RoomModel> listData =
        Provider.of<RoomViewModel>(context, listen: false).listData;
    double totalArea = listData
        .map((data) => data.area)
        .reduce((value, area) => value += area);

    double totalDoorsAndWindowsArea = listData
        .map((data) => data.doorsAndWindowsArea)
        .reduce((value, area) => value += area);

    double availableArea = totalArea - totalDoorsAndWindowsArea;

    return availableArea;
  }

  static InkModel createInkModel(List<double> cans) {
    InkModel returnValues = InkModel(success: true);

    for (var value in cans) {
      if (value == 18.0) returnValues.cans18000 += 1;
      if (value == 3.6) returnValues.cans3600 += 1;
      if (value == 2.5) returnValues.cans2500 += 1;
      if (value == 0.5) returnValues.cans500 += 1;
    }

    if (returnValues.cans500 == 5) {
      returnValues.cans500 = 0;
      returnValues.cans2500 += 1;
    }

    return returnValues;
  }

  static InkModel inkCalculator(BuildContext context, double availableArea) {
    if (availableArea == 0) {
      return InkModel(
          success: false,
          message: AppLocalizations.of(context)!.errorInkCalculator);
    }

    double inkYield = availableArea / 5;
    List<double> variations = [18.0, 3.6, 2.5, 0.5];
    List<double> cans = [];

    for (double value in variations) {
      while (inkYield >= value) {
        inkYield -= value;
        cans.add(value);
      }
    }

    if (inkYield > 0) {
      cans.add(0.5);
    }

    InkModel returnValues = createInkModel(cans);

    return returnValues;
  }
}
