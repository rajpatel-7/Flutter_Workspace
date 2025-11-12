import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedButtonScreen(),
    );
  }
}

class AnimatedButtonScreen extends StatefulWidget {
  @override
  _AnimatedButtonScreenState createState() => _AnimatedButtonScreenState();
}

class _AnimatedButtonScreenState extends State<AnimatedButtonScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Button")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: isPressed ? 200 : 100,
            height: isPressed ? 70 : 50,
            decoration: BoxDecoration(
              color: isPressed ? Colors.blue : Colors.orange,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(
              "Press Me",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
