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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Custom Widget"),
      ),
      body: Column(
        children: [
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
          ),

          // List-Tile wala
          Expanded(
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
          ),

          // Rectangle Container wala Scroll
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              child: ListView.builder(
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
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Expanded(flex: 2, child: Container(color: Colors.red)),
        ],
      ),
    );
  }
}
