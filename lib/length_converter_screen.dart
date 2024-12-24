import 'package:flutter/material.dart';

class LengthConverterScreen extends StatefulWidget {
  const LengthConverterScreen({Key? key}) : super(key: key);

  @override
  State<LengthConverterScreen> createState() => _LengthConverterScreenState();
}

class _LengthConverterScreenState extends State<LengthConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _selectedUnit = 'Meters to Kilometers';

  void _convertLength() {
    final input = _controller.text;
    final value = double.tryParse(input);

    if (value != null) {
      double resultValue;
      if (_selectedUnit == 'Meters to Kilometers') {
        resultValue = value / 1000;
        _result = '$resultValue kilometers';
      } else if (_selectedUnit == 'Centimeters to Meters') {
        resultValue = value / 100;
        _result = '$resultValue meters';
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
        title: const Text('Length Converter'),
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
                DropdownMenuItem(value: 'Meters to Kilometers', child: Text('Meters to Kilometers')),
                DropdownMenuItem(value: 'Centimeters to Meters', child: Text('Centimeters to Meters')),
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
              onPressed: _convertLength,
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
