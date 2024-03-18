// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/data/database.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/pages/homepage.dart';
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
            crossAxisCount: 2, // Number of columns
          ),
          itemCount:
              db.savedLocation.length + 1, // Add 1 for the "Add New" tile
          itemBuilder: (BuildContext context, int index) {
            // Check if it's the "Add New" tile
            if (index == db.savedLocation.length) {
              // Return the "Add New" tile
              return GestureDetector(
                  onTap: () {
                    // Navigate to the page for adding a new location
                  },
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(25),
                    elevation: 4,
                    child: Icon(
                      Icons.add,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ));
            } else {
              // Return the regular LocationTile
              return LocationTile(
                cityName: db.savedLocation[index][0],
                onClickedTile: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(
                        cityName: db.savedLocation[index][0],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
