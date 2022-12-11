import 'package:flutter/material.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/result_model.dart';
import 'package:ink_estimator/model/room_model.dart';

class RoomViewModel extends ChangeNotifier {
  int? _selectedCard;
  int? get selectedCard {
    return _selectedCard;
  }

  void setSelectedCard(int index) {
    _selectedCard = index;
    notifyListeners();
  }

  final List<RoomModel> _listData = [];
  List<RoomModel> get listData {
    return _listData;
  }

  RoomModel getOneData(int index) {
    if (_listData.isEmpty) {
      return RoomModel(
        index: index
      );
    }
    return _listData.firstWhere((element) => element.index == index);
  }

  ResultModel saveData(BuildContext context, RoomModel data) {
    if (data.height == 0) {
      return ResultModel(
        success: false, 
        message: AppLocalizations.of(context)!.emptyHeight
      );
    }

    if (data.width == 0) {
      return ResultModel(
        success: false, 
        message: AppLocalizations.of(context)!.emptyWidth
      );
    }

    _listData.add(data);
    notifyListeners();
    
    return ResultModel(
      success: true, 
      message: AppLocalizations.of(context)!.success
    );
  }
}