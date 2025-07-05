import 'package:flutter/material.dart';

void main() {
  runApp(MyApp8());
}

class MyApp8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NamesListScreen(),
    );
  }
}

class NamesListScreen extends StatelessWidget {
  final List<String> names = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Hank',
    'Ivy',
    'Jack',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Names List'),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            onTap: () {
              print('${names[index]} tapped');
            },
          );
        },
      ),
    );
  }
}
