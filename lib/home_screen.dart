import 'package:flutter/material.dart';
import 'length_converter_screen.dart';
import 'weight_converter_screen.dart';
import 'temperature_converter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LengthConverterScreen()),
                );
              },
              child: const Text('Length Converter'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeightConverterScreen()),
                );
              },
              child: const Text('Weight Converter'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TemperatureConverterScreen()),
                );
              },
              child: const Text('Temperature Converter'),
            ),
          ],
        ),
      ),
    );
  }
}
