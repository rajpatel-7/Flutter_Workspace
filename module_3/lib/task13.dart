import 'package:flutter/material.dart';

void main() {
  runApp(MyApp13());
}

class MyApp13 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp13> {
  String _imageUrl = 'https://via.placeholder.com/150';

  void _changeImage() {
    setState(() {
      _imageUrl = 'https://via.placeholder.com/150/FF5733'; // New image URL
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Change Image App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                _imageUrl,
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeImage,
                child: Text('Change Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
