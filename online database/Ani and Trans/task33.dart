import 'package:flutter/material.dart';

void main() {
  runApp(MyApp33());
}

class MyApp33 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FadeInImage Example'),
        ),
        body: Center(
          child: FadeInImageExample(),
        ),
      ),
    );
  }
}

class FadeInImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage('assets/placeholder.png'),
      image: NetworkImage('https://via.placeholder.com/300'),
      fadeInDuration: Duration(seconds: 1),
      fit: BoxFit.cover,
      width: 300,
      height: 300,
    );
  }
}
