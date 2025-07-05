import 'package:flutter/material.dart';

void main() {
  runApp(CustomListApp());
}

class CustomListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomListScreen(),
    );
  }
}

class CustomListScreen extends StatefulWidget {
  @override
  _CustomListScreenState createState() => _CustomListScreenState();
}

class _CustomListScreenState extends State<CustomListScreen> {
  final List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Styled List'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.list, color: Colors.blue),
              title: Text(
                _items[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeItem(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
