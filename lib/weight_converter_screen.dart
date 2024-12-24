import 'package:flutter/material.dart';

class WeightConverterScreen extends StatefulWidget {
  const WeightConverterScreen({Key? key}) : super(key: key);

  @override
  State<WeightConverterScreen> createState() => _WeightConverterScreenState();
}

class _WeightConverterScreenState extends State<WeightConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _selectedUnit = 'Grams to Kilograms';

  void _convertWeight() {
    final input = _controller.text;
    final value = double.tryParse(input);

    if (value != null) {
      double resultValue;
      if (_selectedUnit == 'Grams to Kilograms') {
        resultValue = value / 1000;
        _result = '$resultValue kilograms';
      } else if (_selectedUnit == 'Pounds to Kilograms') {
        resultValue = value * 0.453592;
        _result = '$resultValue kilograms';
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
        title: const Text('Weight Converter'),
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
                DropdownMenuItem(value: 'Grams to Kilograms', child: Text('Grams to Kilograms')),
                DropdownMenuItem(value: 'Pounds to Kilograms', child: Text('Pounds to Kilograms')),
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
              onPressed: _convertWeight,
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
