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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Custom Widget"),
      ),
      body: Column(
        children: [
          // Re-creating it in a new functional component just like react par iske alag nakhre hai
          CatItems(),

          // List-Tile wala
          Contact(),

          SubContact(),

          FootBar(),
        ],
      ),
    );
  }
}

class CatItems extends StatelessWidget {
  const CatItems({super.key});

  @override
  Widget build(BuildContext context) {
    return
    // Insta Stories jaise
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.blue,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder:
              (context, index) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: CircleAvatar(backgroundColor: Colors.green),
                ),
              ),
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.orange,
        child: ListView.builder(
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.red),
                  title: Text('Name'),
                  subtitle: Text('Mobile No.'),
                  trailing: Icon(Icons.delete),
                ),
              ),
        ),
      ),
    );
  }
}

class SubContact extends StatelessWidget {
  const SubContact({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Container(
        color: Colors.green,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.cyan,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}

class FootBar extends StatelessWidget {
  const FootBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.green,
        child: ListView.builder(
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.red,
                  ),
                ),
              ),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
