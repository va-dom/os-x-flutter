// ignore_for_file: prefer_const_constructors, must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../utils/weather_animation.dart' as weather_animation;

class LocationTile extends StatefulWidget {
  final String cityName;
  Function() onClickedTile;

  LocationTile({Key? key, required this.cityName, required this.onClickedTile})
      : super(key: key);

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

  Future<void> _fetchWeatherFromCity() async {
    setState(() => _isLoading = true);
    try {
      final weather = await _weatherService.getWeatherFromCity(widget.cityName);
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
    return GestureDetector(
      onTap: widget.onClickedTile,
      child: Card(
        //color: Colors.white,
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
                      image: AssetImage(weather_animation
                          .getWeatherAnimation(_weather?.mainCondition)),
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
