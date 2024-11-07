import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConverterScreen(),
    );
  }
}

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _fromUnit = 'kilometers';
  String _toUnit = 'miles';
  String _result = '';

  final Map<String, double> conversionRates = {
    'kilometers_miles': 0.621371,
    'miles_kilometers': 1.60934,
  };

  void _convert() {
    double value = double.tryParse(_controller.text) ?? 0;
    double rate = conversionRates['${_fromUnit}_$_toUnit'] ?? 1;
    double convertedValue = value * rate;

    setState(() {
      _result = '$value $_fromUnit are $convertedValue $_toUnit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measures Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centrer tout le contenu
          children: [
            Text('Value', style: TextStyle(fontSize: 20)),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter value to convert',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'From',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center, // Centrer le texte "From"
            ),
            DropdownButton<String>(
              value: _fromUnit,
              items: ['kilometers', 'miles'].map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _fromUnit = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'To',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center, // Centrer le texte "To"
            ),
            DropdownButton<String>(
              value: _toUnit,
              items: ['miles', 'kilometers'].map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _toUnit = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
