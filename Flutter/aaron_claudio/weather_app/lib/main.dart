import 'package:flutter/material.dart';
import 'package:weather_app/screens/forecast_screen.dart';

import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/location_search_screen.dart';
import 'package:weather_app/themes/themes.dart';
import 'package:weather_app/utils/theme_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      themeMode: getThemeMode(),
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      home: const HomeScreen(),
      routes: {
        '/locationSearch': (context) => const LocationSearchScreen(),
        '/forecast': (context) => const ForecastScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // final List<Map<String, String>> cities = [
//   //   {"name": "New York", "state": "New York", "country": "United States"},
//   //   {"name": "Los Angeles", "state": "California", "country": "United States"},
//   //   // Add more city data as needed
//   // ];
//   List<Map<String, dynamic>> countries = [];

//   @override
//   void initState() {
//     super.initState();
//     // fetchCountriesAndCities();
//   }

//   // Future<void> fetchCountriesAndCities() async {
//   //   final response = await http.get(Uri.parse(
//   //       'https://countriesnow.space/api/v0.1/countries')); //other municipalities not included
//   //   if (response.statusCode == 200) {
//   //     final jsonData = json.decode(response.body);
//   //     if (jsonData['error'] == false) {
//   //       setState(() {
//   //         countries = List<Map<String, dynamic>>.from(jsonData['data']);
//   //       });
//   //     } else {
//   //       // Handle error
//   //       print('Error: ${jsonData['msg']}');
//   //     }
//   //   } else {
//   //     // Handle network error
//   //     print('Failed to load data');
//   //   }
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: const Text('City Search'),
//   //     ),
//   //     body: Padding(
//   //       padding: const EdgeInsets.all(16.0),
//   //       child: TypeAheadField<String>(
//   //         suggestionsCallback: (pattern) {
//   //           if (pattern.isEmpty) {
//   //             return Future.value([]);
//   //           }
//   //           final List<String> matchingCities = [];
//   //           final Set<String> addedCities = {}; // Track added cities
//   //           for (final country in countries) {
//   //             final String? countryName = country['country'];
//   //             final List<dynamic> cities = country['cities'];
//   //             for (final city in cities) {
//   //               if (city.toLowerCase().contains(pattern.toLowerCase())) {
//   //                 // Append country name to city if there's a duplicate
//   //                 final cityName = addedCities.contains(city)
//   //                     ? '$city, ${countryName ?? ''}' // Handle null countryName
//   //                     : city;
//   //                 matchingCities.add(cityName);
//   //                 addedCities.add(city);
//   //               }
//   //             }
//   //           }
//   //           return Future.value(
//   //               matchingCities.isNotEmpty ? matchingCities : []);
//   //         },
//   //         itemBuilder: (context, suggestion) {
//   //           final matchingCountry = countries.firstWhere(
//   //               (country) => country['cities'].contains(suggestion),
//   //               orElse: () => {});
//   //           return ListTile(
//   //             title: Text(suggestion),
//   //             subtitle: Text(matchingCountry['country']),
//   //           );
//   //         },
//   //         onSelected: (suggestion) {
//   //           print('Selected City: $suggestion');
//   //         },
//   //         emptyBuilder: (context) => const SizedBox.shrink(),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
