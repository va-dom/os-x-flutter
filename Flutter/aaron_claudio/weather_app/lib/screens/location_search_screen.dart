import 'package:flutter/material.dart';

class LocationSearchScreen extends StatelessWidget {
  const LocationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Search'),
      ),
      body: const Center(
        child: Text('Location Search Screen'),
      ),
    );
  }
}
