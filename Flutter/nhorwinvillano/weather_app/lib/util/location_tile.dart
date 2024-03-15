// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class LocationTile extends StatefulWidget {
  final String cityName;

  LocationTile({Key? key, required this.cityName}) : super(key: key);

  @override
  State<LocationTile> createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile> {
  late WeatherService _weatherService;
  Weather? _weather;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _weatherService = WeatherService('c6e929f0e45c5aa95b9d8d2bf5546131');
    _fetchWeatherFromCity();
  }

  // weather animations
  String getWeatherAnimation(String? mainCondition) {
    //mainCondition = 'rain';
    if (mainCondition == null) return 'sun.png';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'cloud.png';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'rain.png';
      case 'thunderstorm':
        return 'storm.png';
      case 'clear':
        return 'sun.png';
      default:
        return 'sun.png';
    }
  }

  Future<void> _fetchWeatherFromCity() async {
    setState(() => _isLoading = true);
    try {
      final weather =
          await _weatherService.getWeatherFromCity(cityName: widget.cityName);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(25),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isLoading)
            CircularProgressIndicator()
          else if (_weather != null)
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            _weather!.cityName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        '${_weather!.temperature.round()}°C',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Image(
                    image: AssetImage(
                        getWeatherAnimation(_weather?.mainCondition)),
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
          if (_weather == null)
            Text(
              'Failed to fetch weather data.',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clouds':
        return Icons.cloud;
      case 'clear':
        return Icons.wb_sunny;
      case 'rain':
        return Icons.beach_access;
      default:
        return Icons.cloud;
    }
  }
}
