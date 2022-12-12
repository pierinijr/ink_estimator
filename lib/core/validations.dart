import 'package:flutter/material.dart';
import 'package:ink_estimator/core/utils.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/door_model.dart';
import 'package:ink_estimator/model/result_model.dart';
import 'package:ink_estimator/model/room_model.dart';
import 'package:ink_estimator/model/window_model.dart';

class Validations {
  static ResultModel emptyValidation(BuildContext context, RoomModel data) {
    if (data.height == 0) {
      return ResultModel(
          success: false, message: AppLocalizations.of(context)!.emptyHeight);
    }

    if (data.width == 0) {
      return ResultModel(
          success: false, message: AppLocalizations.of(context)!.emptyWidth);
    }

    return ResultModel(success: true, message: "");
  }

  static ResultModel areaValidation(BuildContext context, RoomModel data) {
    double height = Utils.centimetersToMeters(data.height);
    double width = Utils.centimetersToMeters(data.width);
    double area = Utils.areaCalculator(height, width);

    if (area < 1 || area > 50) {
      return ResultModel(
          success: false, message: AppLocalizations.of(context)!.errorArea);
    }

    double totalAreaDoorsAndWindows =
        (DoorModel().area * data.doors) + (WindowModel().area * data.windows);

    if (totalAreaDoorsAndWindows > (area / 2)) {
      return ResultModel(
          success: false,
          message: AppLocalizations.of(context)!.errorAreaDoorsAndWindows);
    }

    return ResultModel(success: true, message: "");
  }

  static ResultModel doorHeightValidation(
      BuildContext context, RoomModel data) {
    if (data.doors > 0) {
      if (data.height < Utils.metersToCentimeters(DoorModel().height) + 30) {
        return ResultModel(
            success: false,
            message: AppLocalizations.of(context)!.errorDoorHeight);
      }
    }
    return ResultModel(success: true, message: "");
  }

  static ResultModel windowsHeightValidation(
      BuildContext context, RoomModel data) {
    if (data.windows > 0) {
      if (data.height < Utils.metersToCentimeters(WindowModel().height)) {
        return ResultModel(
            success: false,
            message: AppLocalizations.of(context)!.errorWindowHeight);
      }
    }
    return ResultModel(success: true, message: "");
  }

  static ResultModel widthValidation(BuildContext context, RoomModel data) {
    if (data.windows > 0 || data.doors > 0) {
      double windowsWidth = WindowModel().width * data.windows;
      double doorsWidth = DoorModel().width * data.doors;
      if (data.width <
          (Utils.metersToCentimeters(windowsWidth) +
              Utils.metersToCentimeters(doorsWidth))) {
        return ResultModel(
            success: false, message: AppLocalizations.of(context)!.errorWidth);
      }
    }
    return ResultModel(success: true, message: "");
  }

  static ResultModel dataValidation(BuildContext context, RoomModel data) {
    ResultModel emptyValidation = Validations.emptyValidation(context, data);
    if (!emptyValidation.success) return emptyValidation;

    ResultModel areaValidation = Validations.areaValidation(context, data);
    if (!areaValidation.success) return areaValidation;

    ResultModel doorHeightValidation =
        Validations.doorHeightValidation(context, data);
    if (!doorHeightValidation.success) return doorHeightValidation;

    ResultModel windowsHeightValidation =
        Validations.windowsHeightValidation(context, data);
    if (!windowsHeightValidation.success) return windowsHeightValidation;

    ResultModel widthValidation = Validations.widthValidation(context, data);
    if (!widthValidation.success) return widthValidation;

    return ResultModel(
        success: true, message: AppLocalizations.of(context)!.success);
  }
}
