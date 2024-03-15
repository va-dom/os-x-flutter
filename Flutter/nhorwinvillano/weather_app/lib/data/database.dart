import 'package:hive_flutter/adapters.dart';

class LocationDatabase {
  List savedLocation = [];

  //referece our box
  final _myBox = Hive.box('myBox');

  // Run this method if this is the first time opening the app
  void createInitialData() {
    try {
      savedLocation = [
        ['Pasig', false],
        ['Makati', false],
        ['Manila', false],
        ['Batangas', false],
      ];
      _myBox.put("LOCATIONLIST", savedLocation);
    } catch (e) {
      print('Error creating initial data: $e');
    }
  }

  // Load data
  void loadData() {
    savedLocation = _myBox.get("LOCATIONLIST", defaultValue: []);
  }

  // Update the database
  void updateDatabase() {
    try {
      _myBox.put("LOCATIONLIST", savedLocation);
    } catch (e) {
      print('Error updating database: $e');
    }
  }
}
