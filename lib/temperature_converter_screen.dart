import 'package:flutter/material.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({Key? key}) : super(key: key);

  @override
  State<TemperatureConverterScreen> createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _selectedUnit = 'Celsius to Fahrenheit';

  void _convertTemperature() {
    final input = _controller.text;
    final value = double.tryParse(input);

    if (value != null) {
      double resultValue;
      if (_selectedUnit == 'Celsius to Fahrenheit') {
        resultValue = (value * 9 / 5) + 32;
        _result = '$resultValue °F';
      } else if (_selectedUnit == 'Fahrenheit to Celsius') {
        resultValue = (value - 32) * 5 / 9;
        _result = '$resultValue °C';
      }
    } else {
      _result = 'Please enter a valid number.';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedUnit,
              onChanged: (value) {
                setState(() {
                  _selectedUnit = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: 'Celsius to Fahrenheit', child: Text('Celsius to Fahrenheit')),
                DropdownMenuItem(value: 'Fahrenheit to Celsius', child: Text('Fahrenheit to Celsius')),
              ],
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
