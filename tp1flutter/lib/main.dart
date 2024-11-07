import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  String message = "Hello";

  void _incrementCounter() {
    setState(() {
      _counter++;
      message = "Hello $_counter";
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      message = "Hello $_counter";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message, style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.exposure_minus_1),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
