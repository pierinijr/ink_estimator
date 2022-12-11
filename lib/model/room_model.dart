class RoomModel {
  int index;
  double height;
  double width;
  double doors;
  double windows;
  RoomModel({
    required this.index, 
    this.height = 0,
    this.width = 0,
    this.doors = 0,
    this.windows = 0,
    });
}