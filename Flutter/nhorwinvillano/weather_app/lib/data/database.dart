import 'package:hive_flutter/adapters.dart';

class LocationDatabase {
  List savedLocation = [];
  //Set<String> locations = {'Pasig', 'Makati', 'Cebu'};

  //referece our box
  final _myBox = Hive.box('myBox');

  // Run this method if this is the first time opening the app
  void createInitialData() {
    try {
      savedLocation = [
        'Manila',
        'Cebu',
        'Tokyo',
        'New York',
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

  // add new city
  bool addCity(String cityName) {
    if (savedLocation.contains(cityName)) {
      return false; // City already exists
    }
    savedLocation.add(cityName);
    updateDatabase();
    return true; // City added successfully
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
