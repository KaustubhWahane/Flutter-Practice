import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';
import 'list_map_provider.dart';
import 'list_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const CounterScreen(),
      home: ListPage(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterProvider = Provider.of<CounterProvider>(context);
    // print("Print function called");

    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, counterProvider, child) {
            print("Consumer builder called");
            return Text(
              'Counter Value: ${counterProvider.count}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: Consumer<CounterProvider>(
        builder: (context, counterProvider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: counterProvider.increment,
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: counterProvider.decrement,
                child: const Icon(Icons.remove),
              ),
            ],
          );
        },
      ),
    );
  }
}
