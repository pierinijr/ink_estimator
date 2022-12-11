import 'package:flutter/material.dart';
import 'package:ink_estimator/core/calculator.dart';
import 'package:ink_estimator/core/utils.dart';
import 'package:ink_estimator/core/validations.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/ink_model.dart';
import 'package:ink_estimator/model/result_model.dart';
import 'package:ink_estimator/model/room_model.dart';

class RoomViewModel extends ChangeNotifier {
  int? _selectedCard;
  List<RoomModel> _listData = [];

  int? get selectedCard {
    return _selectedCard;
  }

  List<RoomModel> get listData {
    return _listData;
  }

  void setSelectedCard(int index) {
    _selectedCard = index;
    notifyListeners();
  }

  void cleanData() {
    _listData = [];
    notifyListeners();
  }

  RoomModel updateRoomModel(BuildContext context, RoomModel data) {
    double height = Utils.centimetersToMeters(data.height);
    double width = Utils.centimetersToMeters(data.width);

    data.area = Utils.areaCalculator(height, width);

    data.doorsAndWindowsArea = Utils.doorsAndWindowsAreaCalculator(data.doors, data.windows);

    data.dimensions =
        "${height.toStringAsFixed(1)} X ${width.toStringAsFixed(1)}";

    String doors = Utils.quantityValidation(data.doors, "porta");
    String windows = Utils.quantityValidation(data.windows, "janela");

    data.infos = doors +
        (windows.isNotEmpty && doors.isNotEmpty ? " e $windows" : windows);

    if (data.infos.isEmpty) {
      data.infos = AppLocalizations.of(context)!.emptyInfos;
    }

    return data;
  }

  ResultModel saveData(BuildContext context, String height, String width, String doors, String windows) {
    if (_selectedCard != null) {
      RoomModel data = RoomModel(
          index: _selectedCard ?? 0,
          height: Utils.validateParameters(height, "double"),
          width: Utils.validateParameters(width, "double"),
          doors: Utils.validateParameters(doors, "int"),
          windows: Utils.validateParameters(windows, "int"));

      ResultModel validationResult = Validations.dataValidation(context, data);
      if (!validationResult.success) {
        return validationResult;
      }

      data = updateRoomModel(context, data);

      _listData.removeWhere((data) => data.index == _selectedCard);
      _listData.add(data);
      notifyListeners();

      return ResultModel(
          success: true, message: AppLocalizations.of(context)!.success);
    }
    return ResultModel(
        success: false, message: AppLocalizations.of(context)!.tryAgain);
  }

  InkModel getQuantity(BuildContext context) {
    if (_listData.length < 4) {
      return InkModel(success: false, message: AppLocalizations.of(context)!.errorCalculate);
    } 

    double availableArea = Calculator.areaCalculator(context);
    InkModel inkQuantity = Calculator.inkCalculator(context, availableArea);

    return inkQuantity;
  }
}
