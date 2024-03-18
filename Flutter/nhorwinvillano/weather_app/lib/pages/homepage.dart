// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class MyHomePage extends StatefulWidget {
  final String? cityName;

  MyHomePage({Key? key, this.cityName}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // api key
  final _weatherService = WeatherService('c6e929f0e45c5aa95b9d8d2bf5546131');
  Weather? _weather;
  bool _isLoading = true;

  // Fetch weather from position
  Future<void> _fetchWeatherFromPosition() async {
    setState(() => _isLoading = true);
    try {
      Position position = await _weatherService.getCurrentPosition();
      final weather = await _weatherService.getWeatherFromPosition(
          position.longitude, position.latitude);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() => _isLoading = false);
    }
  }

  // Fetch weather from city <---- not used
  Future<void> _fetchWeatherFromCity() async {
    setState(() => _isLoading = true);
    try {
      final weather =
          await _weatherService.getWeatherFromCity(cityName: widget.cityName!);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      print(e);
    }
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

  // init state
  @override
  void initState() {
    super.initState();

    // fetch weather from startup
    (widget.cityName == null)
        ? _fetchWeatherFromPosition()
        : _fetchWeatherFromCity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFEEEFF5),
        title: Center(
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/savedLocation');
                  },
                  child: Icon(Icons.grid_view)),
            ],
          ),
        ),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _weather != null
                ? Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _weather!.cityName,
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Image(
                            image: AssetImage(
                                getWeatherAnimation(_weather?.mainCondition)),
                            width: 200,
                            height: 200,
                          ),
                          SizedBox(height: 40),
                          Text(
                            '${_weather?.temperature.round()}ºC',
                            style: TextStyle(
                                fontSize: 70, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${_weather?.mainCondition}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.opacity),
                                    SizedBox(height: 5),
                                    Text('HUMIDITY'),
                                    Text(
                                      '${_weather!.humidity.toString()}%',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.air),
                                    SizedBox(height: 5),
                                    Text('WIND'),
                                    Text(
                                      '${_weather!.windSpeed.toString()}m/s',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.device_thermostat),
                                    SizedBox(height: 5),
                                    Text('FEELS LIIKE'),
                                    Text(
                                      '${_weather?.feelsLike.round()}ºC',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(
                    'Failed to fetch weather data.',
                    style: TextStyle(color: Colors.red),
                  ),
      ),
    );
  }
}
