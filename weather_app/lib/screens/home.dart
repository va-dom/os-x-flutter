import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/screens/mapScreen.dart';
import 'package:weather_app/widgets/infoCard.dart';

import '../models/locations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationProvider locationProvider = LocationProvider();
  FavLocations? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    await locationProvider.initializeMyLocation();
    setState(() {
      _selectedLocation = locationProvider.locations
          .firstWhere((location) => location.uuid == "0");
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    //bool isDay = now.hour >= 6 && now.hour < 18;
    bool isDay = now.hour <= 6 && now.hour > 18;
    List<Color> colors =
        isDay ? [myDay1, myDay2, myDay3] : [myNight1, myNight2, myNight3];

    LinearGradient gradient = LinearGradient(
        colors: colors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            decoration: BoxDecoration(gradient: gradient),
            child: Column(
              children: [
                FutureBuilder(
                    future: locationProvider.myLocations,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error ${snapshot.error}'));
                      } else {
                        final locationsList = snapshot.data ?? [];

                        return Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownButton<FavLocations?>(
                                dropdownColor: isDay ? Colors.white : myNight3,
                                value: _selectedLocation,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedLocation = value;
                                  });
                                },
                                items: locationsList
                                    .map<DropdownMenuItem<FavLocations?>>(
                                        (location) {
                                  return DropdownMenuItem<FavLocations?>(
                                    value: location,
                                    child: Text(
                                      location.label,
                                      style: TextStyle(
                                        color:
                                            isDay ? Colors.black : Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Visibility(
                                visible: _selectedLocation?.uuid != '0',
                                child: IconButton(
                                  onPressed: () async {
                                    if (_selectedLocation?.uuid == '-1') {
                                      FavLocations newLocation =
                                          await locationProvider.addLocation(
                                              _selectedLocation!.latitude,
                                              _selectedLocation!.longitude);
                                      locationsList.removeWhere(
                                          (location) => location.uuid == '-1');
                                      setState(() {
                                        _selectedLocation = newLocation;
                                      });
                                    } else {
                                      FavLocations? prevLocation = FavLocations(
                                          label: _selectedLocation!.city,
                                          latitude: _selectedLocation!.latitude,
                                          longitude:
                                              _selectedLocation!.longitude,
                                          city: _selectedLocation!.city,
                                          uuid: '-1');
                                      await locationProvider.deleteLocation(
                                          _selectedLocation!.uuid);
                                      setState(() {
                                        locationsList.insert(0, prevLocation);
                                        _selectedLocation = prevLocation;
                                      });
                                    }
                                  },
                                  icon: Icon(_selectedLocation?.uuid == '-1'
                                      ? Icons.star_outline
                                      : Icons.star),
                                  color: isDay ? Colors.black : Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MapScreen(
                                                latitude:
                                                    _selectedLocation!.latitude,
                                                longitude: _selectedLocation!
                                                    .longitude,
                                                isDay: isDay,
                                              ))).then((result) {
                                    if (result != null &&
                                        result['latitude'] != null &&
                                        result['longitude'] != null) {
                                      setState(() {
                                        FavLocations newLocation = FavLocations(
                                            label: result['city'],
                                            latitude: result['latitude'],
                                            longitude: result['longitude'],
                                            city: result['city'],
                                            uuid: '-1');

                                        locationsList.removeWhere((location) =>
                                            location.uuid == '-1');

                                        locationsList.insert(0, newLocation);
                                        _selectedLocation = newLocation;
                                      });
                                    }
                                  });
                                },
                                icon: const Icon(Icons.pin_drop_outlined),
                                color: isDay ? Colors.black : Colors.white,
                              )
                            ],
                          ),
                        );
                      }
                    }),
                if (_selectedLocation != null)
                  Center(
                      child: InfoCard(
                    isFavorite: _selectedLocation?.uuid == '-1' ? false : true,
                    currentLocation: _selectedLocation,
                    isDay: isDay,
                  ))
                else
                  const Center(child: CircularProgressIndicator())
              ],
            )));
  }
}
