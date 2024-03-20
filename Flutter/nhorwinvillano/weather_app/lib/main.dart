// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/homepage.dart';
import 'pages/saved_location.dart';

void main() async {
//init Hive
  await Hive.initFlutter();
//open a box
  var box = await Hive.openBox('myBox');

  runApp(const MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              //background: Color(0xFFEEEFF5),
              brightness: Brightness.dark)),
      home: MyHomePage(),
      routes: {
        '/homePage': (context) => MyHomePage(),
        '/savedLocation': (context) => SavedLocation(),
      },
    );
  }
}
