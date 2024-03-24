import 'package:flutter/material.dart';
import 'package:weather_app/widgets/forecast_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Center(
          child: Text(
            'New York',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.add),
          color: Theme.of(context).textTheme.bodyLarge!.color,
          onPressed: () {
            Navigator.pushNamed(context, '/locationSearch');
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '25', // Replace with dynamic temperature
                  style: TextStyle(
                    fontSize: 100,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                Text(
                  '°C',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ],
            ),
            Text(
              'Sunny',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '33° / 24°',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                )
              ],
            ),
            const Expanded(
              child: SizedBox(), // This will fill the remaining space
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ForecastTile(
                    day: 'Monday',
                    condition: 'Sunny',
                    high: 33,
                    low: 24,
                    textColor: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  ForecastTile(
                    day: 'Tuesday',
                    condition: 'Cloudy',
                    high: 30,
                    low: 22,
                    textColor: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  ForecastTile(
                    day: 'Wednesday',
                    condition: 'Rainy',
                    high: 28,
                    low: 20,
                    textColor: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50, // Full width
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forecast');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).brightness ==
                                Brightness.dark
                            ? Colors.grey[800]
                            : Colors.grey[
                                200], // Set button background color based on theme
                      ),
                      child: Text(
                        '5-day forecast',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors
                                  .black, // Set button text color based on theme
                        ),
                      ),
                    ),
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
