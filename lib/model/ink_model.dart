class InkModel {
  bool success;
  int cans18000;
  int cans3600;
  int cans2500;
  int cans500;
  String message;
  InkModel({
    required this.success, 
    this.cans18000 = 0,
    this.cans3600 = 0,
    this.cans2500 = 0,
    this.cans500 = 0,
    this.message = "",
    });
}