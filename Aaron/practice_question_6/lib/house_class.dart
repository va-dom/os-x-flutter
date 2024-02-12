class House{
  int? id;
  String? name;
  double? prize;

  House(this.id, this.name, this. prize);

  void printDetails(){
    print("ID: $id");
    print("Name: $name");
    print("Prize: $prize");
  }
}