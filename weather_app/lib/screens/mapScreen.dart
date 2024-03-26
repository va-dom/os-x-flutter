import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/constants/colors.dart';

import '../services/geolocation_service.dart';

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final bool isDay;

  const MapScreen(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.isDay});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;
  final GeolocationService geolocationService = GeolocationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: widget.isDay ? Colors.black : Colors.white),
        title: Text(
          'Google Map',
          style: TextStyle(color: widget.isDay ? Colors.black : Colors.white),
        ),
        backgroundColor: widget.isDay ? myDay3 : myNight3,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 12,
        ),
        onMapCreated: (GoogleMapController controller) {

        },
        onTap: (LatLng latLng) {
          setState(() {
            _selectedLocation = latLng;
          });
        },
        markers: _selectedLocation != null
            ? {
                Marker(
                  markerId: const MarkerId('selected_location'),
                  position: _selectedLocation!,
                )
              }
            : {},
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myNight3,
        onPressed: () async {
          final _selectedLocation = this._selectedLocation;
          if (_selectedLocation != null) {
            String cityName = await geolocationService.getCityFromCoordinates(
                _selectedLocation.latitude, _selectedLocation.longitude);

            Navigator.pop(context, {
              'latitude': _selectedLocation.latitude,
              'longitude': _selectedLocation.longitude,
              'city': cityName
            });
          }
        },
        child: const Icon(
          Icons.pin_drop_sharp,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
