import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5 Day Forecast'),
      ),
      body: const Center(
        child: Text('5 Day Forecast Screen'),
      ),
    );
  }
}
