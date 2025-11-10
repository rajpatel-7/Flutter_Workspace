import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

// First Screen with Image
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Hero(
            tag: 'hero-image', // Must be the same tag on both screens
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Optional rounded corners
              child: Image.network(
                'https://source.unsplash.com/random/200x200', // Random image
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Second Screen with Full-Screen Image
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'hero-image', // Same tag as in FirstScreen
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Smooth corners
            child: Image.network(
              'https://source.unsplash.com/random/200x200',
              width: 300, // Bigger size
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
