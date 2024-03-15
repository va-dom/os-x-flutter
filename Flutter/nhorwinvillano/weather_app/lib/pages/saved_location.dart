// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/data/database.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/util/location_tile.dart';

class SavedLocation extends StatefulWidget {
  SavedLocation({super.key});

  @override
  State<SavedLocation> createState() => _SavedLocationState();
}

class _SavedLocationState extends State<SavedLocation> {
  final _myBox = Hive.box('myBox');
  LocationDatabase db = LocationDatabase();

  @override
  void initState() {
    // if this is the 1st time ever opening the app, then create default data
    if (_myBox.get("LOCATIONLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEFF5),
        title: Text('Saved Locations'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2), // Number of columns
        itemCount: db.savedLocation.length,
        itemBuilder: (BuildContext context, int index) {
          return LocationTile(cityName: db.savedLocation[index][0]);
        },
      ),
    );
  }
}
