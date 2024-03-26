import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/services/geolocation_service.dart';

class FavLocations {
  final String uuid;
  final String label;
  final String city;
  final double latitude;
  final double longitude;

  FavLocations(
      {required this.uuid,
      required this.label,
      required this.city,
      required this.latitude,
      required this.longitude});
}

class LocationProvider extends ChangeNotifier {
  final GeolocationService _geolocationService = GeolocationService();
  final List<FavLocations> _locations = [];

  List<FavLocations> get locations => _locations;

  Future<List<FavLocations>> get myLocations async {
    return _locations;
  }

  Future<void> initializeMyLocation() async {
    Position? currentLocation = await _geolocationService.getCurrentLocation();

    String? city = await _geolocationService.getCityFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);

    bool alreadyExists = _locations.any((location) => location.uuid == '0');

    if (!alreadyExists) {
      FavLocations myLocation = FavLocations(
          uuid: "0",
          label: "My Location - $city",
          city: city,
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude);

      _locations.add(myLocation);

      notifyListeners();
    }
  }

  Future<FavLocations> addLocation(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    String city = placemarks.first.locality ?? 'Unknown City';

    String uuid = Uuid().v4();
    FavLocations newLocation = FavLocations(
        uuid: uuid,
        label: city,
        city: city,
        latitude: latitude,
        longitude: longitude);
    _locations.add(newLocation);
    notifyListeners();
    return newLocation;
  }

  Future<void> deleteLocation(String uuid) async {
    _locations.removeWhere((location) => location.uuid == uuid);
    notifyListeners();
  }

}
