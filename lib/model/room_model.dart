class RoomModel {
  int index;
  double height;
  double width;
  int doors;
  int windows;
  double area;
  double doorsAndWindowsArea;
  String dimensions;
  String infos;
  RoomModel({
    required this.index, 
    this.height = 0,
    this.width = 0,
    this.doors = 0,
    this.windows = 0,
    this.area = 0,
    this.doorsAndWindowsArea = 0,
    this.dimensions = "",
    this.infos = "Adicionar medidas!"
    });
}