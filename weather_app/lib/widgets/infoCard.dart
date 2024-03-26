import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/locations.dart';

class InfoCard extends StatefulWidget {
  final FavLocations? currentLocation;
  final bool isDay;
  final bool isFavorite;

  const InfoCard(
      {super.key,
      this.currentLocation,
      required this.isDay,
      required this.isFavorite});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  String? _iconCode;
  String? _weatherCondition;
  String? _weatherDesc;
  int? _temp;
  double? _windSpeed;
  double? _humidity;
  bool _fetchingWeather = false;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  void didUpdateWidget(covariant InfoCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentLocation != widget.currentLocation ||
        oldWidget.isDay != widget.isDay ||
        oldWidget.isFavorite != widget.isFavorite) {
      _fetchWeather();
    }
  }

  Future<void> _fetchWeather() async {
    if (!_fetchingWeather) {
      setState(() {
        _fetchingWeather = true;
        print('fetching weather');
      });
    }
    const apiKey = "bbb4df99f97527ae99dd51e9163ee871";
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?lat=${widget.currentLocation?.latitude}&lon=${widget.currentLocation?.longitude}&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _iconCode = data['weather'][0]['icon'];
          _buildWeatherText(data['weather'][0]['main']);
          _weatherDesc = data['weather'][0]['description'];
          double tempInCelsius = (data['main']['temp'] - 273.15);
          String formatTemp = tempInCelsius.toStringAsFixed(0);
          _temp = int.parse(formatTemp);
          _windSpeed = data['wind']['speed'];
          _humidity = data['main']['humidity'].toDouble();
        });
      } else {
        print('Failed to fetch weather: ${response.statusCode}');
      }
      setState(() {
        print('fetching done');
        _fetchingWeather = false;
      });
    } catch (e) {
      setState(() {
        print('fetching done');
        _fetchingWeather = false;
      });
      print('Error fetching weather: $e');
    }
  }

  void _buildWeatherText(String inputWeather) {
    switch (inputWeather) {
      case 'Rain':
        _weatherCondition = 'Rainy';
        break;
      case 'Snow':
        _weatherCondition = 'Snowy';
        break;
      case 'Clouds':
        _weatherCondition = 'Cloudy';
        break;
      default:
        _weatherCondition = inputWeather;
    }
    if (widget.isDay) {
      _weatherCondition = '$_weatherCondition Day';
    } else {
      _weatherCondition = '$_weatherCondition Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFav = widget.isFavorite;
    Size screenSize = MediaQuery.of(context).size;
    double myWidth = screenSize.width * 0.9;
    double myHeight = screenSize.height * 0.8;
    Color fontColor = widget.isDay ? Colors.white : Colors.white70;
    if (_iconCode == null || _iconCode == '') {
      return CircularProgressIndicator();
    } else {
      return ValueListenableBuilder<bool>(
          valueListenable: ValueNotifier<bool>(isFav),
          builder: (context, value, _) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  width: myWidth,
                  height: myHeight,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 120,
                          child: Container(
                            height: myHeight,
                            child: Stack(
                              children: [
                                BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 2.0,
                                    sigmaY: 2.0,
                                  ),
                                  child: Container(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              Colors.white.withOpacity(0.20)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.white.withOpacity(0.4),
                                            Colors.white.withOpacity(0.1)
                                          ])),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: myWidth,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                                Text(
                                                  '$_temp°C',
                                                  style: TextStyle(
                                                    height: 1.0,
                                                    color: fontColor,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 100,
                                                  ),
                                                ),
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    '${widget.currentLocation?.city}',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      height: 1.0,
                                                      color: fontColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 60,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  '${_weatherCondition?.toUpperCase()}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    height: 1.0,
                                                    color: fontColor,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '${_weatherDesc?.toUpperCase()}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    height: 1.0,
                                                    color: fontColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.wind_power_outlined,
                                                      color: fontColor,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Wind Speed : $_windSpeed ms',
                                                      style: TextStyle(
                                                        color: fontColor,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.water_drop_outlined,
                                                      color: fontColor,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Humidity : $_humidity',
                                                      style: TextStyle(
                                                        color: fontColor,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        top: 0,
                        left: -50,
                        child: SizedBox(
                            width: myWidth,
                            height: 200,
                            child: Image.network(
                              'http://openweathermap.org/img/wn/${_iconCode}@4x.png',
                              fit: BoxFit.cover,
                            )),
                      )
                    ],
                  )),
            );
          });
    }
  }
}
