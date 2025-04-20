import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*
Some info about Stack mujhe likhna chahiye
1 - A widget that positions its children relatives to the edges of its box.
2 - This class is useful if you want to overlap several children in a simple way.
3 - For instance:- Having some text and an image, overlaid with a gradient and a button attached to the bottom.
 */
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(width: 200, height: 200, color: Colors.grey),
          Positioned(
            left: 20,
            top: 10,
            child: Container(width: 140, height: 140, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
