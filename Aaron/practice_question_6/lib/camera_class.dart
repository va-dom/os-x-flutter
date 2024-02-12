class Camera{
  int? _id;
  String? _brand;
  String? _color;
  double? _prize;

  int get getId => _id!;
  String get getBrand => _brand!;
  String get getColor => _color!;
  double get getPrize => _prize!;

  set id(int id) => _id = id;
  set brand(String brand) => _brand = brand;
  set color(String color) => _color = color;
  set prize(double prize) => _prize = prize;

  void printDetails() {
    print("Id: $getId");
    print("Brand: $getBrand");
    print("Color: $getColor");
    print("Prize: $getPrize");
  }
}