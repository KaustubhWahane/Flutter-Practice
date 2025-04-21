import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RangeSliderDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RangeSliderDemo extends StatefulWidget {
  const RangeSliderDemo({super.key});

  @override
  State<RangeSliderDemo> createState() => _RangeSliderDemoState();
}

class _RangeSliderDemoState extends State<RangeSliderDemo> {
  RangeValues _currentRange = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            RangeSlider(
              values: _currentRange,
              min: 0,
              max: 100,
              divisions: 10,
              labels: RangeLabels(
                _currentRange.start.round().toString(),
                _currentRange.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRange = values;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
