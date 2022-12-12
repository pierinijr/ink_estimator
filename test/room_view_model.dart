import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ink_estimator/model/ink_model.dart';
import 'package:ink_estimator/model/room_model.dart';
import 'package:ink_estimator/view_model/room_view_model.dart';
import 'package:provider/provider.dart';

class RoomViewModelTest {
  static updateRoomModelTest(BuildContext context) {
    RoomModel data = RoomModel(index: 0, height: 499.0, width: 499.0);

    var result = Provider.of<RoomViewModel>(context, listen: false).updateRoomModel(context, data);
    expect(result.area, 24.900100000000002);
    expect(result.dimensions, "5.0 X 5.0");
    expect(result.infos, "Nenhuma porta ou janela");

    data.doors = 1;
    result = Provider.of<RoomViewModel>(context, listen: false).updateRoomModel(context, data);
    expect(result.infos, "1 porta");

    data.doors = 2;
    result = Provider.of<RoomViewModel>(context, listen: false).updateRoomModel(context, data);
    expect(result.infos, "2 portas");

    data.doors = 0;
    data.windows = 1;
    result = Provider.of<RoomViewModel>(context, listen: false).updateRoomModel(context, data);
    expect(result.infos, "1 janela");

    data.windows = 2;
    result = Provider.of<RoomViewModel>(context, listen: false).updateRoomModel(context, data);
    expect(result.infos, "2 janelas");

    data.windows = 1;
    data.doors = 1;
    result = Provider.of<RoomViewModel>(context, listen: false).updateRoomModel(context, data);
    expect(result.infos, "1 porta e 1 janela");

    data.windows = 1;
    data.doors = 2;
    result = Provider.of<RoomViewModel>(context, listen: false).updateRoomModel(context, data);
    expect(result.infos, "2 portas e 1 janela");

    data.windows = 2;
    data.doors = 1;
    result = Provider.of<RoomViewModel>(context, listen: false).updateRoomModel(context, data);
    expect(result.infos, "1 porta e 2 janelas");
  }

  static saveDataTest(BuildContext context) {
    var result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "0", "0", "0", "0");
    expect(result.success, false);
    expect(result.message, "Tente novamente preenchendo os dados necessários");

    Provider.of<RoomViewModel>(context, listen: false).setSelectedCard(0);
    int? selectedCart = Provider.of<RoomViewModel>(context, listen: false).selectedCard;
    expect(selectedCart, 0);

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "0", "0", "0", "0");
    expect(result.success, false);
    expect(result.message, "Preencha a altura da sua parede para continuar!");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "200", "0", "0", "0");
    expect(result.success, false);
    expect(result.message, "Preencha a largura da sua parede para continuar!");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "200", "200", "1", "0");
    expect(result.success, false);
    expect(result.message,
        "A parede deve ser 30 centímetros mais alta que a porta.");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "300", "300", "1", "1");
    expect(result.success, false);
    expect(result.message,
        "A área da parede deve ser no mínimo o dobro da área de portas e janelas.");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "5000", "5000", "0", "0");
    expect(result.success, false);
    expect(result.message,
        "A área não pode ser inferior a 1m², nem superior a 50m².");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "5", "5", "0", "0");
    expect(result.success, false);
    expect(result.message,
        "A área não pode ser inferior a 1m², nem superior a 50m².");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "180", "600", "0", "1");
    expect(result.success, false);
    expect(result.message,
        "A parede não tem altura suficiente para janelas. (min 1.90m)");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "1500", "100", "1", "1");
    expect(result.success, false);
    expect(result.message,
        "A parede não tem largura suficiente para a quantidade de portas e janelas.");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "190", "600", "0", "0");
    expect(result.success, true);
    expect(result.message, "Salvo com sucesso!");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "400", "400", "1", "1");
    expect(result.success, true);
    expect(result.message, "Salvo com sucesso!");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "300", "300", "1", "0");
    expect(result.success, true);
    expect(result.message, "Salvo com sucesso!");

    result = Provider.of<RoomViewModel>(context, listen: false).saveData(context, "200", "200", "0", "0");
    expect(result.success, true);
    expect(result.message, "Salvo com sucesso!");
  }

  static InkModel getQuantityResult(context, mockListData) {
    Provider.of<RoomViewModel>(context, listen: false)
        .setListData(mockListData);
    InkModel result =
        Provider.of<RoomViewModel>(context, listen: false).getQuantity(context);
    return result;
  }
  
  static getQuantity(BuildContext context) {
    List<RoomModel> mockListData = [];

    InkModel result = getQuantityResult(context, mockListData);
    expect(result.success, false);
    expect(result.message,
        "Preencha os dados de todas as paredes antes de continuar.");

    mockListData.addAll([
      RoomModel(
          index: 0,
          area: 16.0,
          dimensions: "4.0 X 4.0",
          doors: 1,
          doorsAndWindowsArea: 5.32,
          height: 400.0,
          infos: "1 porta e 1 janela",
          width: 400.0,
          windows: 1),
      RoomModel(
          index: 1,
          area: 20.0,
          dimensions: "4.0 X 5.0",
          doors: 0,
          doorsAndWindowsArea: 0.0,
          height: 400.0,
          infos: "Nenhuma porta ou janela",
          width: 500.0,
          windows: 0),
      RoomModel(
          index: 2,
          area: 10.0,
          dimensions: "2.0 X 5.0",
          doors: 0,
          doorsAndWindowsArea: 3.8,
          height: 200.0,
          infos: "1 janela",
          width: 500.0,
          windows: 1),
      RoomModel(
          index: 3,
          area: 11.97,
          dimensions: "3.0 X 4.0",
          doors: 0,
          doorsAndWindowsArea: 0.0,
          height: 300.0,
          infos: "Nenhuma porta ou janela",
          width: 399.0,
          windows: 1)
    ]);

    result = getQuantityResult(context, mockListData);
    expect(result.success, true);
    expect(result.cans18000, 0);
    expect(result.cans3600, 2);
    expect(result.cans2500, 1);
    expect(result.cans500, 1);

    mockListData = [
      RoomModel(
          index: 0,
          area: 9.0,
          dimensions: "3.0 X 3.0",
          doors: 0,
          doorsAndWindowsArea: 0.0,
          height: 300.0,
          infos: "Nenhuma porta ou janela",
          width: 300.0,
          windows: 0),
      RoomModel(
          index: 1,
          area: 9.0,
          dimensions: "3.0 X 3.0",
          doors: 0,
          doorsAndWindowsArea: 0.0,
          height: 300.0,
          infos: "Nenhuma porta ou janela",
          width: 300.0,
          windows: 0),
      RoomModel(
          index: 2,
          area: 6.25,
          dimensions: "2.5 X 2.5",
          doors: 0,
          doorsAndWindowsArea: 0.0,
          height: 250.0,
          infos: "Nenhuma porta ou janela",
          width: 250.0,
          windows: 0),
      RoomModel(
          index: 3,
          area: 4.0,
          dimensions: "2.0 X 2.0",
          doors: 0,
          doorsAndWindowsArea: 0.0,
          height: 200.0,
          infos: "Nenhuma porta ou janela",
          width: 200.0,
          windows: 1)
    ];

    result = getQuantityResult(context, mockListData);
    expect(result.success, true);
    expect(result.cans18000, 0);
    expect(result.cans3600, 1);
    expect(result.cans2500, 1);
    expect(result.cans500, 0);

    InkModel providerResult = Provider.of<RoomViewModel>(context, listen: false).inkQuantity ?? InkModel(success: false);
    expect(providerResult.success, true);
    expect(providerResult.cans18000, 0);
    expect(providerResult.cans3600, 1);
    expect(providerResult.cans2500, 1);
    expect(providerResult.cans500, 0);

    for (var element in mockListData) {
      element.area = 0;
      element.doorsAndWindowsArea = 0;
    }

    result = getQuantityResult(context, mockListData);
    expect(result.success, false);
    expect(result.message, "Algo deu errado, verifique os dados e tente novamente.");

    Provider.of<RoomViewModel>(context, listen: false).cleanData();
    List<RoomModel> emptyListData = Provider.of<RoomViewModel>(context, listen: false).listData;
    expect(emptyListData, []);
  }
}
