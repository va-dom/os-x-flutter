abstract class Bottle{
  void open();
}

class CokeBottle implements Bottle{
  @override
  void open() {
    print("Coke bottle is opened.");
  }
}

Bottle createBottle() => CokeBottle();