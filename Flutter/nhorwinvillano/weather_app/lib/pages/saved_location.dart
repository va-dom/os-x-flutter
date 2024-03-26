// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/database.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/pages/homepage.dart';
import 'package:weather_app/widgets/add_location_dialog_box.dart';
import '../services/weather_service.dart';
import 'package:weather_app/widgets/location_tile.dart';

class SavedLocation extends StatefulWidget {
  const SavedLocation({super.key});

  @override
  State<SavedLocation> createState() => _SavedLocationState();
}

class _SavedLocationState extends State<SavedLocation> {
  final TextEditingController _location = TextEditingController();

  late WeatherService _weatherService;

  final _myBox = Hive.box('myBox');
  LocationDatabase db = LocationDatabase();

  @override
  void initState() {
    _weatherService = WeatherService('c6e929f0e45c5aa95b9d8d2bf5546131');

    // if this is the 1st time ever opening the app, then create default data
    if (_myBox.get("LOCATIONLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // save new location
  void saveNewLocation() async {
    try {
      final weather = await _weatherService.getWeatherFromCity(_location.text);
      setState(() {
        db.addCity(weather.cityName);
        _location.clear();
      });
      db.loadData();
      Navigator.of(context).pop();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Error',
        desc: e.toString().replaceAll('Exception:', ''),
        //btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AddLocationDialogBox(
                              location: _location,
                              onSave: saveNewLocation,
                              onCancel: () {
                                setState(() {
                                  _location.clear();
                                });
                                Navigator.of(context).pop();
                              });
                        });
                  },
                  child: Card(
                    //color: Colors.white,
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
                cityName: db.savedLocation[index],
                onClickedTile: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(
                        cityName: db.savedLocation[index],
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
